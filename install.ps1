$ErrorActionPreference = 'Stop'

$SettingsRepo = "git@github.com:brentlintner/vim-settings"

$SettingsSrcDir = Join-Path $HOME "src\vim-settings"
$NvimConfigDir  = Join-Path $HOME "AppData\Local\nvim"
$NvimDataDir    = Join-Path $HOME "AppData\Local\nvim-data"

function Test-Tool {
    param([string]$Tool)
    if (-not (Get-Command $Tool -ErrorAction SilentlyContinue)) {
        Write-Error "Warning: $Tool is not installed. Please install it."
        exit 1
    }
}

function Check-Tooling {
    $tools = @("rg", "python3", "pip", "lua", "luarocks", "node", "npm", "ruby", "gem", "nvim")
    Write-Host "==> Checking available tooling..."
    foreach ($tool in $tools) {
        # Skip checking python3 on Windows since Scoop installs it as 'python'
        if ($IsWindows -and $tool -eq "python3") { $tool = "python" }
        Test-Tool $tool
    }
}

function Install-BrewPackages {
    $packages = @("ripgrep", "luarocks", "python", "pyenv", "shellcheck", "node", "ruby")
    Write-Host "==> [MacOS] Installing dependencies with Homebrew..."
    $cmd = "brew install $($packages -join ' ')"
    Write-Host "==> $cmd"
    Invoke-Expression $cmd
}

function Install-ScoopPackages {
    $packages = @("ripgrep", "luarocks", "python3", "pyenv", "shellcheck", "nodejs", "ruby")
    Write-Host "==> [Windows] Installing dependencies with Scoop..."

    foreach ($pkg in $packages) {
        Write-Host "==> scoop install $pkg"
        try {
            scoop install $pkg

            # Scoop is an external command, so we check if it exited cleanly
            if ($LASTEXITCODE -ne 0) {
                Write-Warning "==> Warning: could not install $pkg."
            }
        } catch {
	    Write-Warning "==> Warning: could not install $pkg."
        }
    }
}

function Confirm-AndClean {
    $response = Read-Host "Purge existing Neovim configuration? [y/N]"

    if ($response -match "^[yY]([eE][sS])?$") {
        Write-Host "==> Purging $NvimConfigDir"
        if (Test-Path $NvimConfigDir) { Remove-Item -Recurse -Force $NvimConfigDir }

        Write-Host "==> Purging $NvimDataDir"
        if (Test-Path $NvimDataDir) { Remove-Item -Recurse -Force $NvimDataDir }
    } else {
        Write-Host "==> Skipping purge of existing Neovim configuration."
    }
}

function Install-ToolingPostInstall {
    $commands = @(
        "pip install pynvim",
        "gem install solargraph neovim",
        "npm install -g neovim"
    )

    foreach ($cmd in $commands) {
        Write-Host "==> $cmd"
        Invoke-Expression $cmd
    }
}

function Install-Repo {
    Write-Host "==> Cloning vim-settings repository to $SettingsSrcDir..."
    if (-not (Test-Path $SettingsSrcDir)) {
        git clone $SettingsRepo $SettingsSrcDir
    } else {
        Write-Host "==> Directory $SettingsSrcDir already exists. Skipping clone."
    }

    Write-Host "==> Changing to $SettingsSrcDir directory..."
    Set-Location $SettingsSrcDir

    Confirm-AndClean

    Write-Host "==> Symlinking to $NvimConfigDir"
    # Ensure the parent directory exists before creating the symlink
    $parentDir = Split-Path $NvimConfigDir
    if (-not (Test-Path $parentDir)) {
        New-Item -ItemType Directory -Path $parentDir | Out-Null
    }

    New-Item -ItemType SymbolicLink -Path $NvimConfigDir -Target $SettingsSrcDir -Force | Out-Null
}

function Install-Dependencies {
    Write-Host "==> Installing dependencies..."
    Install-ScoopPackages
    Check-Tooling
    Install-ToolingPostInstall
}

function Configure-Nvim {
    nvim --headless "+Lazy! sync" "+sleep 1" "+qa"
    nvim --headless "+CocUpdateSync" "+sleep 1" "+qa"
    nvim --headless "+UpdateRemotePlugins" "+sleep 1" "+qa"
    nvim --headless "+TSUpdateSync" "+sleep 1" "+qa"

    Write-Host "==> Running healthchecks..."
    # Select-String replaces grep for parsing the stdout
    nvim "+checkhealth"
}

function Main {
    Write-Host "==> Configuring Neovim..."
    Install-Repo
    Install-Dependencies
    Configure-Nvim
    Write-Host "==> Setup complete!"
}

Main

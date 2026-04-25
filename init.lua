local vimrc = vim.fn.stdpath("config") .. "/config.vim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Add this to your init.lua
vim.o.autoread = true

-- Trigger checktime on various events
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

-- Provider config
vim.g.loaded_perl_provider = 0
-- vim.g:python3_host_prog = '/usr/bin/python3'
-- vim.g:pip3_host_prog = '/usr/bin/pip3'

-- HACK: disable deprecation notices
--vim.deprecate = function() end

vim.lsp.log.set_level(vim.log.levels.ERROR)

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    { "brentlintner/twilighted.vim", },
    { "sainnhe/everforest", },
    { "tribela/vim-transparent", },
    { "kchmck/vim-coffee-script", },
    { "tpope/vim-rails", },
    { "airblade/vim-gitgutter", },
    { "editorconfig/editorconfig-vim", },
    { "elzr/vim-json", },
    { "ctrlpvim/ctrlp.vim", },
    { "mileszs/ack.vim", },
    { "ntpeters/vim-better-whitespace", },
    { "scrooloose/nerdcommenter", },
    { "scrooloose/nerdtree", enabled = false },
    { "ryanoasis/vim-devicons", enabled = false },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "tpope/vim-endwise", },
    { "tpope/vim-surround", },
    { "neoclide/coc.nvim", branch = "release", },
    { "brentlintner/vista.vim", },
    {
      "dense-analysis/ale",
      config = function()
        local g = vim.g

        g.ale_disable_lsp = 1
        g.ale_sign_column_always = 1
        g.ale_fix_on_save = 0
        g.ale_lint_on_text_changed = 'never'
        g.ale_lint_on_insert_leave = 0
        g.ale_lint_on_enter = 1
        g.ale_lint_on_save = 1
        g.ale_virtualtext_cursor = 'disabled'

        vim.cmd.highlight('ALEErrorSign guibg=NONE ctermbg=NONE')
        vim.cmd.highlight('ALEWarningSign guibg=NONE ctermbg=NONE')

        g.ale_linters = {
          ruby = {'rubocop', 'ruby'},
          typescript = {'eslint'},
          python = {'ruff', 'ty'}
        }
      end
    },
    { "tpope/vim-fugitive", },
    { "rhysd/git-messenger.vim", },
    { "slim-template/vim-slim", },
    { "brentlintner/RootIgnore", },
    { "HakonHarnes/img-clip.nvim", },
    { "github/copilot.vim", },
    { "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ':TSUpdate',
      branch = "main"
      --config = function()
        --require("nvim-treesitter.configs").setup {
          --disable = {
            --"markdown",
            --"markdown_inline",
            --"ruby",
          --},
          --ensure_installed = {
            --"c",
            --"lua",
            --"vim",
            --"vimdoc",
            --"query",
            --"javascript",
            --"scss",
            --"bash",
            --"comment",
            --"markdown",
            --"dart",
            --"go",
            --"php",
            --"python",
            --"regex",
            --"sql",
            --"typescript",
            --"ruby"
          --},

          --sync_install = false,

          --auto_install = false,

          --indent = {
            --enable = true,
          --},

          --highlight = {
            --enable = true,
             --Setting this to true will run `:h syntax` and tree-sitter at the same time.
             --Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
             --Using this option may slow down your editor, and you may see some duplicate highlights.
             --Instead of true it can also be a list of languages
            --additional_vim_regex_highlighting = false,
            --additional_vim_regex_highlighting = { "markdown" }
          --},
        --}
      --end,
    --},
    }
  }
)

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install {
  'angular',
  'awk',
  'bash',
  'c',
  'c_sharp',
  'clojure',
  'cmake',
  'comment',
  'commonlisp',
  'cpp',
  'css',
  'csv',
  'cuda',
  'd',
  'dart',
  'diff',
  'dockerfile',
  'ecma',
  'editorconfig',
  'elixir',
  'elm',
  'erlang',
  'fish',
  'fsh',
  'fsharp',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'go',
  'gpg',
  'graphql',
  'haskell',
  'html',
  'html_tags',
  'http',
  'ini',
  'java',
  'javadoc',
  'javascript',
  'jq',
  'jsdoc',
  'json',
  'jsx',
  'just',
  'kotlin',
  'latex',
  'llvm',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'markdown_inline',
  'objc',
  'objdump',
  'perl',
  'php',
  'powershell',
  'python',
  'regex',
  'requirements',
  'robots_txt',
  'ruby',
  'rust',
  'scala',
  'scheme',
  'scss',
  'slim',
  'sql',
  'ssh_config',
  'svelte',
  'swift',
  'systemtap',
  'systemverilog',
  'terraform',
  'tmux',
  'todotxt',
  'toml',
  'typescript',
  'vala',
  'vim',
  'vimdoc',
  'vue',
  'xml',
  'xresources',
  'yaml',
  'zig',
  'zsh'
}

require("nvim-tree").setup({
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "__pycache__", ".pytest_cache", ".DS_Store", },
  },
  filesystem_watchers = {
    enable = false,
    debounce_delay = 50,
    ignore_dirs = {
      "node_modules",
      ".git",
      "build",
      "dist",
      "playright-report"
    },
  },
  git = {
    enable = false,
    ignore = false,
  },
  view = {
    centralize_selection = false,
    cursorline = false,
    cursorlineopt = "both",
  },
  renderer = {
    root_folder_label = false
  },
})

-- HACK: Disable statusline when nvim-tree is open (use lua-statusline or something)
require('nvim-tree.api').events.subscribe("TreeOpen", function ()
     vim.wo.statusline = ' '
end)

vim.cmd.source(vimrc)

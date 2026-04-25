local vimrc = vim.fn.stdpath("config") .. "/config.vim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "neoclide/coc.nvim", branch = "release", },
    { "brentlintner/vista.vim", },
    { "tpope/vim-fugitive", },
    { "rhysd/git-messenger.vim", },
    { "brentlintner/RootIgnore", },
    { "HakonHarnes/img-clip.nvim", },
    { "github/copilot.vim", },
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

        g.ale_linters = {
          ruby = {'rubocop', 'ruby'},
          typescript = {'eslint'},
          python = {'ruff', 'ty'}
        }
      end
    },
    { "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ':TSUpdate',
      branch = "main"
    },
  }
)

-- Provider config
vim.g.loaded_perl_provider = 0
vim.lsp.log.set_level(vim.log.levels.ERROR)

-- Auto reload files when changed on disk
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

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

vim.cmd([[
  au BufRead,BufNewFile *.plist set filetype=xml
  au BufRead,BufNewFile *.gpx set filetype=xml
  au BufRead,BufNewFile *.service set filetype=toml
  au BufRead,BufNewFile *.env* set filetype=sh
  au BufRead,BufNewFile *.hbs set filetype=html
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.plist",
  callback = function()
    vim.bo.filetype = "xml"
  end,
})

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

vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-solargraph',
  'coc-phpls',
  'coc-html',
  'coc-css',
  'coc-vetur',
  'coc-flutter',
  'coc-vimlsp',
  'coc-sh',
  'coc-pyright',
  'coc-go',
}

vim.g.copilot_filetypes = {
  gitcommit = true,
}

vim.g.better_whitespace_enabled=1

vim.g.RootIgnoreUseHome = 1
vim.g.RootIgnoreAgignore = 0


vim.g.ctrlp_cmd = 'CtrlP'
vim.g.ctrlp_max_files = 0
vim.g.ctrlp_show_hidden = 1
vim.g.ctrlp_working_path_mode = '0'
vim.g.ctrlp_clear_cache_on_exit = 1
vim.g.ctrlp_user_command = { '.git', 'rg --files --hidden --follow --color never %s' }
vim.g.ackprg = '--vimgrep --hidden --no-ignore --follow'

vim.g["vista#renderer#enable_icon"] = 0
vim.g.vista_default_executive = 'coc'
vim.g.vista_sidebar_width = 40
vim.g.vista_floating_delay = 100
vim.g.vista_update_on_text_changed = 1
vim.g.vista_update_on_text_changed_delay = 0
vim.g.vista_blink = "[0, 0]"
vim.g.vista_echo_cursor = 0
vim.g.vista_echo_cursor_strategy = 'floating_win'
vim.g.vista_cursor_delay = 0
vim.g.vista_disable_statusline = 1
vim.g.vista_highlight_whole_line = 1
vim.g.vista_fzf_preview = 'right:50%'
vim.g.vista_enable_centering_jump = 0
vim.g.vista_find_nearest_method_or_function_delay = 0

vim.g.gitgutter_set_sign_backgrounds = 0

vim.g.vim_markdown_folding_disabled=1

vim.g.gist_detect_filetype = 1
vim.g.gist_post_private = 1

--let g:git_messenger_floating_win_opts = { 'border': 'single' }
vim.g.git_messenger_no_default_mappings = true

vim.g.typescript_compiler_binary = 'npx tsc'
vim.g.typescript_compiler_options = ''

-- Disable build in file explorer
vim.loaded_netrw = 1
vim.loaded_netrwPlugin = 1

-- Anything UX/UI related
vim.cmd.source(vimrc)

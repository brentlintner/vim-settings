local vimrc = vim.fn.stdpath("config") .. "/config.vim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- HACK: disable deprecation notices
--vim.deprecate = function() end

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  vim.cmd [[packadd lazy.nvim]]
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    {
      "brentlintner/twilighted.vim",
    },
    {
      "sainnhe/everforest",
    },
    {
      "tribela/vim-transparent",
    },
    {
      "kchmck/vim-coffee-script",
    },
    {
      "tpope/vim-rails",
    },
    {
      "airblade/vim-gitgutter",
    },
    {
      "editorconfig/editorconfig-vim",
    },
    {
      "elzr/vim-json",
    },
    {
      "ctrlpvim/ctrlp.vim",
    },
    {
      "mileszs/ack.vim",
    },
    {
      "ntpeters/vim-better-whitespace",
    },
    {
      "scrooloose/nerdcommenter",
    },
    {
      "scrooloose/nerdtree",
      enabled = false
    },
    {
      "ryanoasis/vim-devicons",
      enabled = false
    },
    {
    {
      "nvim-tree/nvim-tree.lua"
    },
      "nvim-tree/nvim-web-devicons",
      opts = {}
    },
    {
      "tpope/vim-endwise",
    },
    {
      "tpope/vim-surround",
    },
    {
      "neoclide/coc.nvim",
      branch = "release",
    },
    {
      "brentlintner/vista.vim",
    },
    {
      "dense-analysis/ale",
    },
    {
      "tpope/vim-fugitive",
    },
    {
      "rhysd/git-messenger.vim",
    },
    {
      "slim-template/vim-slim",
    },
    {
      "brentlintner/RootIgnore",
    },
    {
      "HakonHarnes/img-clip.nvim",
    },
    {
      "github/copilot.vim",
    },
    {
      "nvim-treesitter/nvim-treesitter",
      branch = "master", -- Use master for frozen backwards compatibility for now
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "scss",
            "bash",
            "comment",
            "dart",
            "go",
            "php",
            "python",
            "regex",
            "sql",
            "typescript",
            --"ruby"
          },

          sync_install = false,

          auto_install = false,

          highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
        }
      end,
    },
  },
  {}
)

vim.cmd.source(vimrc)

require("nvim-tree").setup({
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  view = {
    centralize_selection = false,
    cursorline = false,
    cursorlineopt = "both",
  },
  renderer = {
    root_folder_label = ":~:s?$??"
  },
})

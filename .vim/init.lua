local vimrc = vim.fn.stdpath("config") .. "/config.vim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

-- NOTE: Here is how you would change lazy defaults, but we are leaving as is in this example
-- require("lazy").setup(
--   import("plugins"),
--   {
--     defaults = {
--       lazy = true, -- set to false if you want all loaded on startup
--       -- It's recommended to leave version=false for now, since a lot the plugin that support versioning, don't conform to semver
--       version = false, -- always use the latest git commit
--       -- version = "*", -- try installing the latest stable version for plugins that do support semver
--     },
--   }
-- )

require("lazy").setup(
  {
    -- -- NOTE: First, some basic plugins
    -- { "nvim-lua/popup.nvim" },
    -- { "nvim-lua/plenary.nvim" },

    -- -- NOTE: Core plugins like theme and treesitter
    -- { import = "plugins.core" },

    -- -- NOTE: Plugins in this file.
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
      "godlygeek/csapprox",
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
    },
    {
      "ryanoasis/vim-devicons",
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

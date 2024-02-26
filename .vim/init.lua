local vimrc = vim.fn.stdpath("config") .. "/config.vim"
vim.cmd.source(vimrc)

require'nvim-treesitter.configs'.setup {
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
		"ruby"
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

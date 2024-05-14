require("ts_context_commentstring").setup()
vim.g.skip_ts_context_commentstring_module = true

local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
	highlight = { enable = true },
	ensure_installed = {
		"vim",
		"vimdoc",
		"lua",
		"javascript",
		"typescript",
		"json",
		"tsx",
		"yaml",
		"css",
		"html",
		"prisma",
		"markdown",
		"markdown_inline",
		"c",
		"gitignore",
		"bash",
	},
	sync_install = true,
	indent = { enable = true },
	incremental_selection = { enable = true },
	autotag = {
		enable = true,
		enable_close_on_slash = false,
	},
})

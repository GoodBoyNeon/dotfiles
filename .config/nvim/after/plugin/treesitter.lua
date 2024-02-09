local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
	ensure_installed = { "vim", "vimdoc", "lua", "javascript", "typescript" },
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
	autotag = {
		enable = true,
		enable_close_on_slash = false,
	},
	context_commentstring = { enable = true, enable_autocmd = false },
})

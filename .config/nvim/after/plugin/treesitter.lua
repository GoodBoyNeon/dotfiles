local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = { "vim", "vimdoc", "lua", "javascript", "typescript" },
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = { enable = true },
	autotag = { enable = true },
	context_commentstring = { enable = true, enable_autocmd = false },
})

local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.stylua,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = sources,

	-- format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ timeout_ms = 2000 })
				end,
			})
		end
	end,
})

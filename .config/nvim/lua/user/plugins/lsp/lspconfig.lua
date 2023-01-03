local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local typescript_status_ok, typescript = pcall(require, "typescript")

if not lspconfig_status_ok then
	return
end
if not cmp_nvim_lsp_status_ok then
	return
end
if not typescript_status_ok then
	return
end

-- local map = vim.api.nvim_set_keymap
local map = vim.api.nvim_buf_set_keymap
local keymap = vim.api.nvim_set_keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }

	-- set keybinds
	map(bufnr, "n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	map(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	map(bufnr, "n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	map(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	map(bufnr, "n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	map(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	map(bufnr, "n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	map(bufnr, "n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	map(bufnr, "n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	map(bufnr, "n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	map(bufnr, "n", "M", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	map(bufnr, "n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	if client.name == "tsserver" then
		keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", {})
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

local schemastore_status_ok, schemastore = pcall(require, "schemastore")
if not schemastore_status_ok then
	return
end

lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		json = {
			schemas = schemastore.json.schemas({}),
		},
	},
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("package.json"),
})
lspconfig["denols"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["emmet_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})
lspconfig["sqlls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

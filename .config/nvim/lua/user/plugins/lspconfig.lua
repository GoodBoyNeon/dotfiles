local status_ok, lspconfig = pcall(require, "lspconfig")
local typescript_status_ok, typescript = pcall(require, "typescript")
local neodev_status_ok, neodev = pcall(require, "neodev")
local schemastore_status_ok, schemastore = pcall(require, "schemastore")

if not status_ok then
	return
end
if not typescript_status_ok then
	return
end
if not neodev_status_ok then
	return
end

-- Neodev setup (perform before lspconfig setup)
neodev.setup({})

local map = vim.keymap.set
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	-- keymaps
	local opts = { noremap = true, silent = true, buffer = bufnr }

	map("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
	map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
	map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
	map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
	map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
	map("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
	map("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
	map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
	map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
	map("n", "m", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
	map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

	if client.name == "tsserver" then
		map("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
		map("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports
		map("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables

		client.resolved_capabilities.document_formatting = false -- Turn off tsserver formatting in favor of null-ls
	end

	if client.name == "eslint" then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagonstics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = { "typescript-language-server", "--stdio" },
	},
})

lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			schemaStore = {
				-- You must disable built-in schemaStore support if you want to use
				-- this plugin and its advanced options like `ignore`.
				enable = true,
				-- enable = false,
			},
			-- schemas = require('schemastore').yaml.schemas(),
		},
	},
})

lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,

	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
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

lspconfig["astro"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["eslint"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["prismals"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["ltex"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["marksman"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["graphql"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

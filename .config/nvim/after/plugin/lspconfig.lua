local lspconfig = require("lspconfig")
local neodev = require("neodev")
local schemastore = require("schemastore")

-- Neodev setup (perform before lspconfig setup)
neodev.setup({})

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local map = function(key, func)
		vim.keymap.set("n", key, func, opts)
	end
	-- keymaps

	map("<leader>c", "<cmd>Lspsaga code_action<CR>") -- see available code actions
	-- map("<leader>c", vim.lsp.buf.code_action) -- see available code actions

	map("<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
	-- map("<leader>rn", vim.lsp.buf.rename)

	-- map("gd", "<cmd>Lspsaga peek_definition<CR>") -- see definition and make edits in window
	map("gd", vim.lsp.buf.definition) -- see definition and make edits in window

	-- map("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>") -- got to declaration
	map("gD", vim.lsp.buf.declaration) -- got to declaration

	-- map("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
	map("gi", vim.lsp.buf.implementation) -- go to implementation

	map("M", vim.lsp.buf.type_definition)

	-- map("m", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
	map("m", vim.lsp.buf.hover)

	map("gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
	map("<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>") -- show  diagnostics for line
	map("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostics for cursor
	map("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
	map("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
	map("<leader>o", "<cmd>Lspsaga outline<CR>") -- see outline on right hand side

	map("gr", require("telescope.builtin").lsp_references)
	map("<leader>s", require("telescope.builtin").lsp_document_symbols)
	map("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)

	if client.name == "tsserver" then
		map("<leader>oi", "<CMD>OrganizeImports<CR>")
	end

	if client.name == "eslint" then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local clangdCapabilities = require("cmp_nvim_lsp").default_capabilities()
clangdCapabilities.offsetEncoding = { "utf-16" }

lspconfig["clangd"].setup({
	on_attach = on_attach,
	capabilities = clangdCapabilities,
})

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

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "typescript-language-server", "--stdio" },
	init_options = {
		preferences = {
			disableSuggestions = false, -- change to true to disable suggestions like "File may be converted to ESM"
		},
	},
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
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
lspconfig["pylsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["jdtls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["dockerls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- require("mason-lspconfig").setup_handlers({
-- 	function(server_name)
-- 		lspconfig[server_name].setup({
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 		})
-- 	end,
-- })

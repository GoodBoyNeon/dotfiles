local status_ok, cmp = pcall(require, "cmp")
local luasnip_status_ok, luasnip = pcall(require, "luasnip")
local lspkind_status_ok, lspkind = pcall(require, "lspkind")

if not status_ok then
	return
end

if not luasnip_status_ok then
	return
end

if not lspkind_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

-- local kind_icons = {
--   Text = "",
--   Method = "",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "ﴯ",
--   Interface = "",
--   Module = "",
--   Property = "ﰠ",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = ""
-- }

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		-- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
	}),
	-- formatting = {
	-- fields = { "kind", "abbr", "menu" },
	-- format = function(entry, vim_item)
	--   -- Kind icons
	--   vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
	--   vim_item.menu = ({
	--     buffer = "[Buffer]",
	--     nvim_lsp = "[LSP]",
	--     luasnip = "[LuaSnip]",
	--     nvim_lua = "[Lua]",
	--     latex_symbols = "[LaTeX]",
	--     path = "[Path]",
	--   })[entry.source.name]
	--   return vim_item
	-- end,
	-- },
	formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "nvim_lua" }, -- nvim_lua source
		{ name = "luasnip" }, -- snippets
		{ name = "path" }, -- file paths
		{ name = "buffer" }, -- items in the buffer, ex. text
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

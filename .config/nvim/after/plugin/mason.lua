local status_ok, mason = pcall(require, "mason")
local mason_lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
local mason_null_ls = require('mason-null-ls')

if not status_ok then
  return
end
if not mason_lsp_status_ok then
  return
end

mason.setup()

mason_lsp.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "lua_ls",
  },
})


mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
  }
})

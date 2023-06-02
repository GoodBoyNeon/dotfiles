local status_ok, mason = pcall(require, "mason")
local mason_lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")

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

mason_null_ls.setup()
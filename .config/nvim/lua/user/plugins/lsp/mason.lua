local status_ok, mason = pcall(require, 'mason')
local mason_lspconfig_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')

if not mason_null_ls_status then
  return
end
if not status_ok then return end
if not mason_lspconfig_status then return end

mason.setup {}

mason_lspconfig.setup {
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "tailwindcss",
    "sumneko_lua"
  }
}

mason_null_ls.setup {
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
  }
}

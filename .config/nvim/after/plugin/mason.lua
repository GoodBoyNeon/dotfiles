local status_ok, mason = pcall(require, "mason")
local mason_lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")

local mason_tool_installer = require("mason-tool-installer")

if not status_ok then
  return
end
if not mason_lsp_status_ok then
  return
end

mason.setup({
  ensure_installed = {
    "eslint-lsp",
    "lua-language-server",
    "html",
    "cssls",
    "tailwindcss",
    "typescript-language-server",
    "prettier",
  },
})

mason_lsp.setup()

mason_tool_installer.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "isort",
    "black",
    "eslint_d",
    "pylint"
  }
})

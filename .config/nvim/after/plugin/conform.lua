require("conform").setup({
  formatters_by_fit = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    python = { "isort", "black" },
    lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 1000,
  }
})

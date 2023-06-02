local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

if not status_ok then
  return
end

treesitter.setup({

  highlight = {
    enable = true,
    disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 10000 end,
  },
  incremental_selection = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },

})

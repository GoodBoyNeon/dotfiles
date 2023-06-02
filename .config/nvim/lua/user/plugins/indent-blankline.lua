local status_ok, indent_blankline = pcall(require, 'indent_blankline')

if not status_ok then return end

indent_blankline.setup({
show_trailing_blankline_indent = false,
  use_treesitter = true,
  char = "▏",
  context_char = "▏",
  show_current_context = true,
})

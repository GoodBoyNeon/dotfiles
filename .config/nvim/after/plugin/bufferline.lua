local status_ok, bufferline = pcall(require, "bufferline")

bufferline.setup({
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    color_icons = true,
    separator_style = "slant",
  },
  highlights = {
    separator = {
      fg = "#1a1b26",
      bg = "#24283b",
    },
    separator_selected = {
      fg = "#1a1b26",
    },
    background = {
      fg = "#565f89",
      bg = "#24283b",
    },
    buffer_selected = {
      fg = "#c0caf5",
      bold = true,
      hl_name = "asdf",
    },
    fill = {
      bg = "#1a1b26",
    },
  },
})

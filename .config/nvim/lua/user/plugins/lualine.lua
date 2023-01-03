local status_ok, lualine = pcall(require, "lualine")

if not status_ok then return end


local lualine_catppuccin = require "lualine.themes.catppuccin"

if not lualine_catppuccin then
  print('Lualine theme not found')
  return
end

local colors = {
  blue = '#89b4fa',
  green = '#a6e3a1',
  violet = '#cba6f7',
  yellow = '#f9e2af',
  black = '#11111b'
}

lualine_catppuccin.normal.a.bg = colors.blue
lualine_catppuccin.insert.a.bg = colors.green
lualine_catppuccin.visual.a.bg = colors.violet
lualine_catppuccin.command.a.bg = colors.yellow

lualine.setup {
  options = {
    theme = lualine_catppuccin
  }
}

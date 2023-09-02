local status_ok, telescope = pcall(require, "telescope")

local keymap = vim.keymap
local map = keymap.set
local opts = { slient = true }

if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {},
})

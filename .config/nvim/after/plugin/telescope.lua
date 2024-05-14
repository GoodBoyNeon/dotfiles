local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		path_display = { "smart" },
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {},
})

local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

local actions = require("telescope.actions")
local project_actions = require("telescope._extensions.project.actions")

-- local function telescope_buffer_dir()
-- 	return vim.fn.expand("%:p:h")
-- end

-- Extensions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		project = {
			display_type = "full",
			base_dirs = {
				"~/dev/cheeka/",
			},
			hidden_files = false,
			theme = "dropdown",
			search_by = "title",
		},
	},

	extensions_list = { "themes", "terms" },
})

telescope.load_extension("project")
-- telescope.load_extension("themes")

local map = vim.api.nvim_set_keymap
local opts = { silent = true }

map(
	"n",
	"<leader>ff",
	'<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>',
	opts
)
map("n", "<leader>lg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map("n", "<leader>ht", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map("n", "<leader>rr", '<cmd>lua require("telescope.builtin").resume()<cr>', opts)
map("n", "<leader>wd", '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)

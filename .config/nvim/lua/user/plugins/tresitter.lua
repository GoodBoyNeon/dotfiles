local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	autotag = { enable = true },
	ensure_installed = {
		"json",

		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"bash",
		"lua",
		"vim",
		"gitignore",
	},
	auto_install = true,
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autopairs = {
		enable = true,
	},
})

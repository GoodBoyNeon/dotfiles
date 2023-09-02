require("toggleterm").setup({
	open_mapping = "<space>n",
	insert_mappings = false,
	border = "curved",
	hide_numbers = true,
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
	},
	start_in_insert = true,
	shell = vim.o.shell,
})

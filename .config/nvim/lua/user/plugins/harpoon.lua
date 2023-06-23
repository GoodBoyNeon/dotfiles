local status_ok, harpoon = pcall(require, "harpoon")

if not status_ok then
	return
end

vim.api.nvim_set_keymap("n", "<leader>m", "<CMD>lua require('harpoon.mark').add_file()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>ht", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })

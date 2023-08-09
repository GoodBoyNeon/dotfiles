local status_ok, peek = pcall(require, "peek")

if not status_ok then
	return
end

peek.setup({
	app = "browser", -- 'webview', 'browser', string or a table of strings
})

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

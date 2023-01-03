local status_ok, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")

if not status_ok then
	print("Colorscheme not found!")
	return
end


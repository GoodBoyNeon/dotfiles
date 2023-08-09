local status_ok, notify = pcall(require, "notify")

if not status_ok then
	return
end

-- notify.setup({
-- 	top_down = false,
-- })
--
-- vim.notify = notify

local status_ok, trouble = pcall(require, "trouble")

if not status_ok then
  return
end

trouble.setup({
  icons = true,
  signs = {
    -- icons / text used for a diagnostic
    -- error = "E",
    error = "󰅚",
    warning = "",
    hint = "󰌶",
    information = "",
    other = "󰗡"
  },
})

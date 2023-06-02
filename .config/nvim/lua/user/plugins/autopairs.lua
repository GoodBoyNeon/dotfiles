local status_ok, autopairs = pcall(require, "nvim-autopairs")

autopairs.setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt", "vim" },
})

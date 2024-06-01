-->> Line Number Bar
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.nuw = 6
vim.opt.signcolumn = "yes"

-->> Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-->> Indentation
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2      -- 2 spaces for <TAB>
vim.opt.shiftwidth = 2   -- 2 spaces for indent width
vim.opt.expandtab = true -- convert tab -> spaces


vim.opt.mouse = ''        -- disable mouse
vim.opt.laststatus = 2    -- have statusline on all windows
vim.opt.scrolloff = 6     -- scrolling offset (vertical)
vim.opt.sidescrolloff = 6 -- scrolling offset (horizontal)
vim.opt.wrap = false      -- disable line wrapping
vim.opt.winblend = 10     -- transparency for floating windows
vim.opt.cursorline = true -- enable line highlight (doesn't work in transparency mode)
-- vim.opt.backupskip = "/tmp/*,/private/tmp/*"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.backspace = "start,eol,indent"
vim.opt.path:append({ "***" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.clipboard:append({ "unnamedplus" })

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Cs = "\e[4:0m"]])

-- file tree
vim.cmd("let g:netrw_liststyle = 3")

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.opt.formatoptions:append({ "r" })

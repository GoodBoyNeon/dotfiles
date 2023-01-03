local o = vim.opt

-- Line numbers
o.number = true -- Display line numbers
o.relativenumber = true -- Display line numbers relative to cursor
o.numberwidth = 5 -- Resize the number line (default 4)

-- Clipboard
o.clipboard:append("unnamedplus") -- System clipboard support

-- Appearance
o.termguicolors = true -- Enable true colors in nvim
o.background = "dark" -- Use dark themes by default for schemes that have multiple types

-- Window splitting
o.splitbelow = true -- Always spilt horizontal windows on the bottom
o.splitright = true -- Always spilt vertical windows to the right

-- Swaps and backups
o.swapfile = false -- Disable swap files
o.writebackup = false -- Let other editors write to same file opened in nvim
o.backup = false -- Disable backup files

-- Search
o.ignorecase = true -- Don't be case sensitive if all in lowercase
o.smartcase = true -- Be case sensitive only if search query has uppercase letters
o.ruler = false -- Don't show line number and column on the default bar
o.wrap = false -- Disable word wrapping
o.cmdheight = 1 -- Width of command menu
o.pumheight = 10 -- Pop-up-menu height
o.signcolumn = "yes" -- Always display the sign bar (gutter)
o.showtabline = 2 -- Always show tabs
o.cursorline = true -- Highlight current column
o.scrolloff = 8 -- No. of lines to show above and below vh
o.sidescrolloff = 8 -- No. of lines to show on the left and right
o.shell = "fish" -- Set the default shell to fish shell
o.mouse = "a" -- Enable mouse support
o.hlsearch = true -- Highlight search results
o.timeoutlen = 500 -- Time to wait for a map to timeout
o.undofile = true -- Enable presistent undo
o.updatetime = 300 -- Faster completion

-- Indentation
o.tabstop = 2 -- Insert 2 spaces for a Tab
o.shiftwidth = 2 -- No. of spaces inserted in an indentation
o.softtabstop = 2 -- Force 2 spaces for every type of indentation
o.expandtab = true -- Use the appropriate no. of spaces to insert a <Tab>
o.smartindent = true -- Do smart indenting, ex. auto-tab {}, [], etc.
o.smarttab = true -- Extension of smartindent
o.autoindent = true -- Copy indentation from current line when starting a new line

o.guifont = "JetBrainsMono Nerd Font:17" -- For for nvim GUI applications
o.iskeyword:append("-") -- Use "-" keyword as part of a word

-- File encoding
o.encoding = "utf-8"
o.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

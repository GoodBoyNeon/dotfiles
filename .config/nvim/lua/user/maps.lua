local keymap = vim.keymap
local map = keymap.set
local opts = { silent = true }

vim.g.mapleader = " "

-- BUFFERLINE --
map("n", "J", "<CMD>BufferLineCyclePrev<CR>")
map("n", "K", "<CMD>BufferLineCycleNext<CR>")
map("n", "X", "<CMD>Bdelete<CR>", opts)

-- NORMAL MODE --
map("n", ";", ":")

map("n", "x", '"_x')

map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "dw", 'vb"_d')

map("n", "<C-a>", "gg<S-v>G")
map("n", "<leader>e", ":Neotree toggle right<CR>")

map("n", "m", ":vim.lsp.buf.hover")

map("n", "tt", "<CMD>lua require('nvterm.terminal').toggle 'float'<CR>")
map("n", "<leader>hh", "<CMD>nohl<CR>")

-- window management
map("n", "te", ":tabedit<Return>", { silent = true })
map("n", "ss", ":split<Return><C-w>w")
map("n", "sv", ":vsplit<Return><C-w>w")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<C-S-h>", "<C-w><")
map("n", "<C-S-j>", "<C-w>-")
map("n", "<C-S-k>", "<C-w>+")
map("n", "<C-S-l>", "<C-w>>")

-- INSERT MODE --
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

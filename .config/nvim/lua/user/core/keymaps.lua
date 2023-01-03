local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts) -- Do nothing when just space is pressed
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE --

-- Window navigation

-- ## Commented because an extension does the same ## --
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)

-- Spliting windows
map("n", "<leader>sv", "<C-w>v", opts) -- Split window vertically
map("n", "<leader>sh", "<C-w>s", opts) -- Split window horizontally
map("n", "<leader>se", "<C-w>=", opts) -- Make windows equal in width and height
map("n", "<leader>sx", ":close<cr>", opts) -- Close the focused split window
map("n", "<leader>sm", ":MaximizerToggle<cr>", opts)

-- Switching buffers
map("n", "J", ":BufferLineCyclePrev<CR>", opts) -- Go to previous tab
map("n", "K", ":BufferLineCycleNext<CR>", opts)

map("n", "<A-j>", ":move .+1<CR>", opts) -- Move text up
map("n", "<A-k>", ":move .-2<CR>", opts) -- Move text down

map("n", "x", '"_x', opts) -- Donot yank when using 'x'
map("n", ";", ":", opts) -- Enter command mode with ';'
map("n", "<C-a>", "gg<S-v>G", opts) -- Select all

map("n", "=", "<C-a>", opts) -- Increment
map("n", "-", "<C-x>", opts) -- Decrement

map("n", "<leader>e", ":NvimTreeToggle<cr>", opts) -- Toggle file expolorer

map("n", "<leader>nh", ":nohl<cr>", opts) -- Remove search highlights

map("n", "X", ":Bdelete<CR>", opts) -- Close buffers with X

-- Telescope
map("n", "<leader>f", ":Telescope find_files<cr>", opts)
map("n", "<leader>g", ":Telescope live_grep<cr>", opts)
map("n", "<leader>b", ":Telescope buffers<cr>", opts)

-- INSERT MODE --

map("i", "jk", "<C-[>", opts) -- Enter normal mode
map("i", "kj", "<C-[>", opts) -- Enter normal mode

-- VISUAL MODE --

map("v", "<", "<gv", opts) -- Don't leave visual mode after indenting
map("v", ">", ">gv", opts) -- Don't leave visual mode after indening

-- VISUAL BLOCK MODE --

map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

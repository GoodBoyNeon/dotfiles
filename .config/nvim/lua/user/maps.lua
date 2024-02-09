local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- BUFFERLINE --
map("n", "J", "<CMD>BufferLineCyclePrev<CR>", opts)
map("n", "K", "<CMD>BufferLineCycleNext<CR>", opts)
map("n", "X", "<CMD>Bdelete<CR>", opts)

map("n", "te", "<CMD>tabedit<CR>", opts) -- new tab
map("n", "<Tab>", "<CMD>tabnext<CR>", opts)

-- NORMAL MODE --
map("n", ";", ":", opts)

map("n", "x", '"_x') -- Delete char without yanking
map("n", "dw", "vb_d") -- Delete word backwards
map("n", "<C-a>", "gg<S-v>G") -- Select all

map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "dw", 'vb"_d')

map("n", "<leader>e", "<CMD>Neotree toggle right<CR>", opts)

map("n", "tt", "<CMD>lua require('nvterm.terminal').toggle 'float'<CR>")
map("n", "<leader>hh", "<CMD>nohl<CR>")

-- window
map("n", "ss", ":split<Return><C-w>w", opts)
map("n", "sv", ":vsplit<Return><C-w>w", opts)

-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

-- map("n", "<C-S-h>", "<C-w><")
-- map("n", "<C-S-j>", "<C-w>-")
-- map("n", "<C-S-k>", "<C-w>+")
-- map("n", "<C-S-l>", "<C-w>>")

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files({ hidden_files = true })
end, opts)
map("n", "<leader>lg", function()
	require("telescope.builtin").live_grep()
end, opts)

map("n", "<leader>b", function()
	require("telescope.builtin").buffers()
end, opts)
map("n", "<leader>rr", function()
	require("telescope.builtin").resume()
end, opts)
map("n", "<leader>wd", function()
	require("telescope.builtin").diagnostics()
end, opts)

-- INSERT MODE --
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")
-- ^^ Replaced by better-escape.nvim plugin!

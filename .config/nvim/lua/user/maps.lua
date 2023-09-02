local map = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = " "

map({ "n", "v" }, "<Space>", "<Nop>", opts)

-- BUFFERLINE --
map("n", "J", "<CMD>BufferLineCyclePrev<CR>", opts)
map("n", "K", "<CMD>BufferLineCycleNext<CR>", opts)
map("n", "X", "<CMD>Bdelete<CR>", opts)

-- NORMAL MODE --
map("n", ";", ":", opts)

map("n", "x", '"_x')

map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "dw", 'vb"_d')

map("n", "<C-a>", "gg<S-v>G")
map("n", "<leader>e", "<CMD>Neotree toggle right<CR>", opts)

map("n", "tt", "<CMD>lua require('nvterm.terminal').toggle 'float'<CR>")
map("n", "<leader>hh", "<CMD>nohl<CR>")

-- window management
map("n", "te", ":tabedit<Return>", opts)
map("n", "ss", ":split<Return><C-w>w", opts)
map("n", "sv", ":vsplit<Return><C-w>w", opts)

-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

map("n", "<C-S-h>", "<C-w><")
map("n", "<C-S-j>", "<C-w>-")
map("n", "<C-S-k>", "<C-w>+")
map("n", "<C-S-l>", "<C-w>>")

-- TELESCOPE
-- map("n", "<leader>ff", '<CMD>lua require("telescope.builtin").find_files({ hidden_files = true })<CR>', opts)
-- map("n", "<leader>lg", '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
-- map("n", "<leader>b", '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
-- map("n", "<leader>rr", '<CMD>lua require("telescope.builtin").resume()<CR>', opts)
-- map("n", "<leader>wd", '<CMD>lua require("telescope.builtin").diagnostics()<CR>', opts)

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

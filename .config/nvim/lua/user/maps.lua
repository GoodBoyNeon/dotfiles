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

map("n", "x", '"_x')          -- Delete char without yanking
map("n", "dw", "vb_d")        -- Delete word backwards
map("n", "<C-a>", "gg<S-v>G") -- Select all

map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "dw", 'vb"_d')

map("n", "<leader>hh", "<CMD>nohl<CR>")

-- window
map("n", "ss", "<cmd>split<cr><C-w>w", opts)
map("n", "sv", "<cmd>vsplit<cr><C-w>w", opts)
map("n", "sx", "<cmd>close<cr>", opts)

-- telescope
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files({ hidden_files = true })
end, opts)
map("n", "<leader>lg", function()
  require("telescope.builtin").live_grep()
end, opts)

map("n", "<leader>b", function()
  require("telescope.builtin").buffers()
end, opts)
map("n", "<leader>r", function()
  require("telescope.builtin").resume()
end, opts)
map("n", "<leader>d", function()
  require("telescope.builtin").diagnostics()
end, opts)
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>")

-- auto-session
map("n", "<leader>wr", "<cmd>SessionRestore<cr>")
map("n", "<leader>ws", "<cmd>SessionSave<cr>")

-- todo-comments
map("n", "[t", function()
  require("todo-comments").jump_prev()
end)
map("n", "]t", function()
  require("todo-comments").jump_next()
end)

-- INSERT MODE --

-- map("i", "jk", "<Esc>")
-- map("i", "kj", "<Esc>")
-- !: ^^ Replaced by better-escape.nvim plugin

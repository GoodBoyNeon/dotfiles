local map = vim.keymap.set
local opts = { noremap = false, silent = true }

vim.g.mapleader = " "

map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]])

-- BUFFERS --
map("n", "J", ":bprev<cr>", opts)
map("n", "K", ":bnext<cr>", opts)
map("n", "X", ":bdelete<cr>", opts)

map("n", "te", "<CMD>tabedit<CR>", opts) -- new tab
map("n", "<Tab>", "<CMD>tabnext<CR>", opts)

-- NORMAL MODE --
map("n", ";", ":")

map("n", "x", '"_x')     -- Delete char without yanking
map("n", "dw", "vbd")    -- Delete word backwards

map("n", "B", "^", opts) -- go to start
map("n", "E", "$", opts) -- go to end

map("n", "<leader>hl", "<CMD>nohl<CR>")

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

-- trouble
map("n", "<leader>xx", function() require("trouble").toggle() end)
map("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
map("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
map("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
map("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
map("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- neo-tree
map("n", "<leader>ee", "<cmd>Neotree toggle float<cr>")
map("n", "<leader>es", "<cmd>Neotree toggle right<cr>")

-- INSERT MODE --

-- map("i", "jk", "<Esc>")
-- map("i", "kj", "<Esc>")
-- !: ^^ Replaced by better-escape.nvim plugin

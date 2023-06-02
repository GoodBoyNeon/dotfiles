local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")

if not status_ok then
  print("Lazy is not installed!")
  return
end

lazy.setup({
  -- Color Schemes
  "folke/tokyonight.nvim",
  "navarasu/onedark.nvim",
  "rebelot/kanagawa.nvim",

  "andweeb/presence.nvim",
  "windwp/nvim-autopairs",
  "lukas-reineke/indent-blankline.nvim",

  -- Lualine: Statusline
  "hoob3rt/lualine.nvim",

  -- Bufferline
  { "akinsho/bufferline.nvim", version = "*",         dependencies = "nvim-tree/nvim-web-devicons" },
  "famiu/bufdelete.nvim",

  -- Git integration
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",

  -- cmp
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  -- snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "numToStr/Comment.nvim",

  -- Mason: Installing LSP servers
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  "williamboman/mason-lspconfig.nvim",

  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },

  -- LSP: Language Server Protocol
  "neovim/nvim-lspconfig",
  "onsails/lspkind-nvim",
  "jose-elias-alvarez/typescript.nvim", -- Typescript

  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },

  -- SchemaStore (JSON and YAML)
  "b0o/schemastore.nvim",

  'jose-elias-alvarez/null-ls.nvim',
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- nvim surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  -- Neodev: docs and completion for nvim lua API
  "folke/neodev.nvim",

  -- Neo-tree (file tree viewer)
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  },

  -- Fuzzy finder (Telescope)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Telescope projects
  "nvim-telescope/telescope-project.nvim",

  -- Colorizer: Preview color and hex codes
  "NvChad/nvim-colorizer.lua",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
  },

  -- nvim-notify: Notification Manager
  "rcarriga/nvim-notify",

  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  -- Start Screen
  "goolord/alpha-nvim",

  -- Markdown preview
  { "toppair/peek.nvim", build = "deno task --quiet build:fast" },

  {
    "NvChad/nvterm",
  },
})

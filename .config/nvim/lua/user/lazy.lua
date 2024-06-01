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
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local bg = "#1a1b26"
      require("tokyonight").setup({
        style = "storm",
        on_colors = function(colors)
          ---@diagnostic disable-next-line: inject-field
          colors.bg = bg
        end,
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    "navarasu/onedark.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "xiyaowong/transparent.nvim",
  },

  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "vim" },
      })
      require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,
  },
  "windwp/nvim-ts-autotag",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({})
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
  },

  -- Lualine: Statusline
  "hoob3rt/lualine.nvim",

  -- Bufferline
  { "akinsho/bufferline.nvim",                  version = "*",         dependencies = "nvim-tree/nvim-web-devicons" },
  "famiu/bufdelete.nvim",

  -- Git integration
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
  },

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

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function() end,
  },

  "christoomey/vim-tmux-navigator",

  -- Mason: Installing LSP servers
  { "williamboman/mason.nvim",                  build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },

  -- LSP: Language Server Protocol
  "neovim/nvim-lspconfig",
  "onsails/lspkind-nvim",

  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  "stevearc/dressing.nvim", -- improve vim.ui.select and vim.ui.input hooks

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  }, -- formatting

  -- {
  --   "mfussenegger/nvim-lint",
  --   -- event = { "BufReadPre", "BufNewFile" },
  -- },

  -- SchemaStore (JSON and YAML)
  "b0o/schemastore.nvim",

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- nvim surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup(
      -- Configuration here, or leave empty to use defaults
      )
    end,
  },
  -- Neodev: docs and completion for nvim lua API
  "folke/neodev.nvim",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/todo-comments.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
  },

  -- Colorizer: Preview color and hex codes
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          names = false,
          css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
          tailwind = true, -- Enable tailwind colors
        },
      })
    end,
  },

  -- nvim-notify: Notification Manager
  "rcarriga/nvim-notify",

  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Start Screen
  { "goolord/alpha-nvim",           event = "VimEnter" },

  -- Markdown preview
  { "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "kj" }, -- a table with mappings to use
      })
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*" },

  -- Neovim plugin for splitting/joining blocks of code
  {
    "Wansmer/treesj",
    keys = { "<C-s>" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { use_default_keymaps = false },
  },
  {
    "aurum77/live-server.nvim",
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    init = function()
      require("live_server.util").install()
    end,
  },
  -- Java language server
  {
    "mfussenegger/nvim-jdtls",
  },

  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup({
        enabled = false,
        neovim_image_text = "Yes, I am a vim nerd", -- Text displayed when hovered over the Neovim image
      })
    end,
  },

  -- sessions
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/dev/", "~/Downloads/", "/" },
      })
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },

  "eandrju/cellular-automaton.nvim",
})

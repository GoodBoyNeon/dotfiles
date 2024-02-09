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
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({

				check_ts = true,
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	"windwp/nvim-ts-autotag",

	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},

	-- Lualine: Statusline
	"hoob3rt/lualine.nvim",

	-- Bufferline
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
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
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function() end,
	},

	"christoomey/vim-tmux-navigator",

	-- Mason: Installing LSP servers
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	{ "williamboman/mason-lspconfig.nvim" },

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

	-- Formatting
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},

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
	-- Hypersnoic - Regexp explainer
	{
		"tomiis4/Hypersonic.nvim",
		event = "CmdlineEnter",
		cmd = "Hypersonic",
		config = function()
			require("hypersonic").setup({})
		end,
	},

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

	-- Colorizer: Preview color and hex codes
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					names = false,
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
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
	"goolord/alpha-nvim",

	-- Markdown preview
	{ "iamcco/markdown-preview.nvim", build = "cd app && yarn install" },

	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "kj" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
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
})

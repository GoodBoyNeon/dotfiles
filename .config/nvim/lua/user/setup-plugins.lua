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

	"andweeb/presence.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({

				check_ts = true,
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline.init").setup({
				show_trailing_blankline_indent = false,
				use_treesitter = true,
				char = "▏",
				context_char = "▏",
				show_current_context = true,
			})
		end,
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
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	"christoomey/vim-tmux-navigator",

	-- Mason: Installing LSP servers
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
	"williamboman/mason-lspconfig.nvim",

	-- Null-ls and Mason-null-ls
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

	"jose-elias-alvarez/null-ls.nvim",
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
				names = false,
			})
		end,
	},

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
})

-- Automatically install packer

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packer itself

	use("windwp/nvim-autopairs") -- Automatically inserts pairs of {, (, ", etc.
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- Auto-close html and jsx tags
	use("tpope/vim-surround") -- Too hard to explain, basically provides keybindings to add "", '' etc. easily
	use("vim-scripts/ReplaceWithRegister") -- Replace something with the last item in register (clipboard)

	use("numToStr/Comment.nvim") -- Comment lines using a shortcut
	use("nvim-tree/nvim-tree.lua") -- File explorer written in lua

	use("christoomey/vim-tmux-navigator") -- Make vim work more like tmux
	use("szw/vim-maximizer") -- Maximizes and restores splits

	-- DEPENDENCIES --
	use("nvim-lua/popup.nvim") -- Popup API in nvim
	use("nvim-lua/plenary.nvim") -- Denpendency for many plugs

	-- THEMES --
	use("catppuccin/nvim") -- Catppuccin theme
	use("bluz71/vim-nightfly-guicolors") -- nightfly colorscheme

	-- LSP CONFIG --
	use("neovim/nvim-lspconfig") -- LSP
	use("williamboman/mason.nvim") -- Install and manage plugins
	use("williamboman/mason-lspconfig.nvim") -- Provides extra functionalities to mason
	use("onsails/lspkind.nvim") -- Adds vscode-like icons to completion window
	use("jose-elias-alvarez/typescript.nvim") -- Typescript functionalities in lsp
	use("jose-elias-alvarez/null-ls.nvim") -- Provides formatting and linting
	use("jayp0521/mason-null-ls.nvim") -- Makes it easier to install formaters and linters
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- Cool UI for lsp
	use("b0o/schemastore.nvim") -- Provides json schemas from https://schemastore.org

	-- CODE COMPLETION --
	use("hrsh7th/nvim-cmp") -- Code completion engine
	use("hrsh7th/cmp-nvim-lsp") -- LSP intellisense in cmp
	use("hrsh7th/cmp-nvim-lua") -- LSP source for lua
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path intellisense
	use("hrsh7th/cmp-cmdline") -- Cmdline completions

	-- SNIPPETS --
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("saadparwaiz1/cmp_luasnip") -- Luasnip compatibility with cmp
	use("rafamadriz/friendly-snippets") -- Collection of snippets

	-- FUZZY FINDER --
	use("nvim-telescope/telescope.nvim") -- Telescope: fuzzy finder
	use("nvim-telescope/telescope-media-files.nvim") -- Preview images inside telescope

	-- VISUALS --
	use("p00f/nvim-ts-rainbow") -- Colorize bracket pairs
	use("lewis6991/gitsigns.nvim") -- Display hunks for areas where git changes are made
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("akinsho/bufferline.nvim") -- Adding schemes to buffers
	use("nvim-lualine/lualine.nvim") -- Status line written in lua
	use("moll/vim-bbye")
	use("glepnir/dashboard-nvim") -- Startup screen for neovim (only starts if neovim is launched with no file)
	use("lukas-reineke/indent-blankline.nvim") -- Indentation lines
	use("norcalli/nvim-colorizer.lua") -- Highlights hex/rgb/hsl codes
	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

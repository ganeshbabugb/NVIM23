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

local plugins = {
	-- lua functions that many plugins use
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",

	-- Preferred colorscheme
	"bluz71/vim-nightfly-guicolors",

	-- Tmux & split window navigation
	"christoomey/vim-tmux-navigator",

	-- maximizes and restores current window
	"szw/vim-maximizer",

	-- Essential plugins
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"yamatsum/nvim-cursorline",

	-- Commenting with gc
	"numToStr/Comment.nvim",

	-- Vs-code like icons
	"nvim-tree/nvim-web-devicons",

	-- Statusline
	"nvim-lualine/lualine.nvim",

	-- Fuzzy finding w/ telescope
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
	"nvim-telescope/telescope-hop.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- Managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- configuring lsp servers
	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	{ "glepnir/lspsaga.nvim", branch = "main" },
	"jose-elias-alvarez/typescript.nvim",
	"onsails/lspkind.nvim",

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag", -- auto rename the tags in html
		},
	},

	-- Auto closing
	"windwp/nvim-autopairs",

	-- Git integration
	"lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",

	--Dashboard
	"goolord/alpha-nvim",

	-- Bookmarks
	"MattesGroeger/vim-bookmarks",
	"tom-anders/telescope-vim-bookmarks.nvim",

	-- Auto-run program
	"CRAG666/code_runner.nvim",

	-- debug adapter per language
	"mfussenegger/nvim-dap",

	-- Wilder popup
	"gelguy/wilder.nvim",

	-- Staline [lua line alternative]
	"tamton-aquib/staline.nvim",

	-- Clipboard Manager using nvim-neoclip
	"AckslD/nvim-neoclip.lua",

	-- Fidget for better loading UI
	"j-hui/fidget.nvim",

	-- This is for practicing vim
	"ThePrimeagen/vim-be-good",

	-- Indent line
	"lukas-reineke/indent-blankline.nvim",

	-- Easy escape
	"max397574/better-escape.nvim",

	-- File explorer
	"nvim-tree/nvim-tree.lua",
	-- "nvim-neo-tree/neo-tree.nvim",

	-- Toggle term
	"akinsho/toggleterm.nvim",

	-- Dart
	"dart-lang/dart-vim-plugin",

	-- Flutter dev
	"akinsho/flutter-tools.nvim",

	-- Zen-Mode
	"folke/zen-mode.nvim",
	-- "folke/twilight.nvim",

	-- ccc(color picker)
	"uga-rosa/ccc.nvim",

	-- This plugin generate codesnip png using silicon
	"segeljakt/vim-silicon",

	-- This plugin help me to move cursor word by word in camelcase
	"chaoren/vim-wordmotion",

	-- Save browser bookmarks
	"lalitmee/browse.nvim",

	-- This is for fastest raping HTML
	"mattn/emmet-vim",

	-- This hide the Right Hand Side coloum
	"m4xshen/smartcolumn.nvim",

	-- for vim multiple cursor
	"terryma/vim-multiple-cursors",

	-- simple text animation
	"eandrju/cellular-automaton.nvim",

	-- undo tree for undoes
	"mbbill/undotree",

	-- this is for math calculations
	"jbyuki/quickmath.nvim",

	-- fold functions
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
}

local opts = {
	defaults = { lazy = false },
	install = { colorscheme = { "nightfly" } },

	ui = {
		icons = {
			ft = "",
			lazy = "鈴 ",
			loaded = "",
			not_loaded = "",
		},
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"ftplugin",
			},
		},
	},
}

require("lazy").setup(plugins, opts)

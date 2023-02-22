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
local packer_bootstrap = ensure_packer()

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")

	-- preferred colorscheme
	use("bluz71/vim-nightfly-guicolors")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	-- use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	-- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("kylechui/nvim-surround")

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	--Dashboard
	use("goolord/alpha-nvim")

	-- bookmarks
	use("MattesGroeger/vim-bookmarks")
	use("tom-anders/telescope-vim-bookmarks.nvim")

	-- ChatGPT OpenAI
	use("jackMort/ChatGPT.nvim")

	-- auto-run program
	use("CRAG666/code_runner.nvim")

	-- debug adapter per language
	use("mfussenegger/nvim-dap")

	-- wilder
	use("gelguy/wilder.nvim")

	-- staline [lua line alternative]
	use("tamton-aquib/staline.nvim")

	-- Clipboard Manager using nvim-neoclip
	use("AckslD/nvim-neoclip.lua")

	-- fidget for better loading UI
	use("j-hui/fidget.nvim")

	-- lightspeed for quick cursor movements
	-- use("ggandor/lightspeed.nvim")

	-- this is for practicing vim
	use("ThePrimeagen/vim-be-good")

	-- Indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- easy escape
	use("max397574/better-escape.nvim")

	-- neovim session manager
	-- use({
	-- 	"Shatur/neovim-session-manager",
	-- 	event = "BufWritePost",
	-- })

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-neo-tree/neo-tree.nvim")

	-- toggle term
	use("akinsho/toggleterm.nvim")

	-- Dart
	use("dart-lang/dart-vim-plugin")

	-- flutter dev
	use("akinsho/flutter-tools.nvim")

	-- Zen-Mode
	use("folke/zen-mode.nvim")

	-- Packer
	if packer_bootstrap then
		require("packer").sync()
	end
end)

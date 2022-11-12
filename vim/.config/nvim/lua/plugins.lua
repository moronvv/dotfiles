-- PLUGINS

-- Install packer.
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
	[[
	  augroup Packer
	    autocmd!
	    autocmd BufWritePost init.lua PackerCompile
	  augroup end
	]],
	false
)

require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use 'tpope/vim-fugitive' -- Git commands in nvim
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
	use 'tpope/vim-surround'
	use 'tpope/vim-unimpaired'
	use 'tpope/vim-repeat'
	use 'tpope/vim-abolish'
	use 'tpope/vim-vinegar'
	use 'tpope/vim-sleuth'
	use 'tpope/vim-obsession'

	-- Autosave
	use '907th/vim-auto-save'

	-- Disables highlighting after search
	use 'romainl/vim-cool'

	-- UI to select things (files, grep results, open buffers...)
	use { 'nvim-telescope/telescope.nvim', requires = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
	}
	}

	use 'itchyny/lightline.vim' -- Fancier statusline

	use 'sainnhe/gruvbox-material'

	-- Add git related info in the signs columns and popups
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	-- Additional textobjects for treesitter
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

	-- autocompletion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- snippets
	-- use 'L3MON4D3/LuaSnip'
	-- use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'rafamadriz/friendly-snippets'

	use { 'mcchrish/zenbones.nvim', requires = 'rktjmp/lush.nvim' }
end)

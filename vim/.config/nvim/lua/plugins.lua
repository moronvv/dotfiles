-- Install packer.
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute(
    "!git clone https://github.com/wbthomason/packer.nvim " .. install_path
  )
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

require("packer").startup(function()
  use("wbthomason/packer.nvim") -- Package manager

  -- MISCS
  use("tpope/vim-fugitive") -- git commands in nvim
  use("tpope/vim-commentary") -- "gc" to comment visual regions/lines
  use("tpope/vim-surround") -- surrounder for parentheses, brackets, quotes etc
  use("tpope/vim-unimpaired") -- move operations with [ and ]
  use("tpope/vim-repeat") -- helper for . repeat operations
  use("tpope/vim-abolish") -- smart sabstitution
  use("tpope/vim-vinegar") -- compfy settings for netrw
  use("tpope/vim-sleuth") -- 'shiftwidth' and 'expandtab' automatical adjustment
  use("tpope/vim-obsession") -- session saver
  use("tpope/vim-eunuch") -- helper unix commands for files
  use("nelstrom/vim-visual-star-search") -- star serch on visual selection
  use("arnamak/stay-centered.nvim") -- keep view in the center of screen

  -- UI

  -- custom icons
  use("nvim-tree/nvim-web-devicons")
  use("onsails/lspkind.nvim")

  -- themes
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "rose-pine/neovim", as = "rose-pine" })
  use("xiyaowong/nvim-transparent") -- transparency

  -- indent
  use("lukas-reineke/indent-blankline.nvim")

  -- statusline
  use("nvim-lualine/lualine.nvim")
  use("arkav/lualine-lsp-progress")

  -- file explorer
  -- use("prichrd/netrw.nvim") -- fancy netrw
  use("stevearc/oil.nvim")

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  -- WORKFLOW

  -- fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  -- auto-save
  -- TODO: move to main branch after empty msg fix
  use({ "Pocco81/auto-save.nvim", branch = "dev" })

  -- tmux
  use("christoomey/vim-tmux-navigator")

  -- lang switcher
  use("lyokha/vim-xkbswitch")

  -- disables highlighting after search
  use("romainl/vim-cool")

  -- git signs
  use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

  -- autoclose pairs
  -- use 'windwp/nvim-autopairs'
  use("rstacruz/vim-closer")

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("WhoIsSethDaniel/mason-tool-installer.nvim")
  use("neovim/nvim-lspconfig") -- collection of configurations for built-in LSP client
  use("ray-x/lsp_signature.nvim") -- show function signature on insert

  -- highlight, edit, and navigate code using a fast incremental parsing library
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/nvim-treesitter-context")
  use("RRethy/nvim-treesitter-endwise")

  -- autocompletion
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("andersevenrud/cmp-tmux")
  use("lukas-reineke/cmp-under-comparator") -- helper for sorting kinds
  use("hrsh7th/nvim-cmp")

  -- snippets
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use("rafamadriz/friendly-snippets")

  -- markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
end)

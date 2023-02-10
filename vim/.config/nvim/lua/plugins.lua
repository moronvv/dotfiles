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

require("lazy").setup({
  -- MISCS
  "tpope/vim-commentary", -- "gc" to comment visual regions/lines
  "tpope/vim-surround", -- surrounder for parentheses, brackets, quotes etc
  "tpope/vim-unimpaired", -- move operations with [ and ]
  "tpope/vim-repeat", -- helper for . repeat operations
  "tpope/vim-abolish", -- smart sabstitution
  "tpope/vim-vinegar", -- compfy settings for netrw
  "tpope/vim-sleuth", -- 'shiftwidth' and 'expandtab' automatical adjustment
  "tpope/vim-obsession", -- session saver
  "tpope/vim-eunuch", -- helper unix commands for files
  "nelstrom/vim-visual-star-search", -- star serch on visual selection
  "arnamak/stay-centered.nvim", -- keep view in the center of screen
  "romainl/vim-cool", -- disables highlighting after search
  "christoomey/vim-tmux-navigator", -- tmux
  "lyokha/vim-xkbswitch", -- lang switcher

  -- UI
  -- themes
  { "catppuccin/nvim", name = "catppuccin" },
  { "rose-pine/neovim", name = "rose-pine" },
  "xiyaowong/nvim-transparent", -- transparency

  -- indent
  "lukas-reineke/indent-blankline.nvim",

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "arkav/lualine-lsp-progress",
      "nvim-tree/nvim-web-devicons", -- icons
    },
  },

  -- file explorer
  -- "prichrd/netrw.nvim", -- fancy netrw
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- icons
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- WORKFLOW

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons", -- icons
    },
  },

  -- auto-save
  -- TODO: move to main branch after empty msg fix
  { "Pocco81/auto-save.nvim", branch = "dev" },

  -- git signs
  "tpope/vim-fugitive", -- git commands in nvim
  "lewis6991/gitsigns.nvim",

  -- autoclose pairs
  -- "windwp/nvim-autopairs"
  "rstacruz/vim-closer",

  -- LSP
  {
    -- collection of configurations for built-in LSP client
    "neovim/nvim-lspconfig",
    dependencies = {
      -- UI and autoinstall for LSPs
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- show function signature on insert
      "ray-x/lsp_signature.nvim",
    },
  },

  -- highlight, edit, and navigate code using a fast incremental parsing library
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "RRethy/nvim-treesitter-endwise",
    },
  },

  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- additional completion options
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- snippets
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "rafamadriz/friendly-snippets",

      -- misc
      "lukas-reineke/cmp-under-comparator", -- helper for sorting kinds
      "nvim-tree/nvim-web-devicons", -- icons
      "onsails/lspkind.nvim", -- kinds for autocompletion
    },
  },

  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
})

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

  -- miscs
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
  use("felipec/vim-sanegx") -- fix gx link opener

  -- UI to select things (files, grep results, open buffers...)
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  -- devicons
  use("nvim-tree/nvim-web-devicons")

  -- themes
  use("sainnhe/gruvbox-material")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("xiyaowong/nvim-transparent") -- transparency

  -- indent
  use("lukas-reineke/indent-blankline.nvim")

  -- statusline
  use("nvim-lualine/lualine.nvim")
  use("arkav/lualine-lsp-progress")

  -- file explorer
  use("prichrd/netrw.nvim") -- fancy netrw

  -- autosave
  use("907th/vim-auto-save")

  -- tmux
  use("christoomey/vim-tmux-navigator")

  -- lang switch
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

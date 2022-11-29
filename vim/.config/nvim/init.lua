require("plugins")
require("keybindings")

require("plugs.lsp")
require("plugs.xkbswitch")
require("plugs.lualine")
require("plugs.treesitter")
require("plugs.cmp")
require("plugs.telescope")
require("plugs.gitsigns")
require("plugs.fugitive")
require("plugs.autosave")
require("plugs.indent_blankline")

-- Incremental live completion (note: this is now a default on master).
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.inccommand = "nosplit"

-- Make relative line numbers default. The current line number will be shown as well as relative numbering from that current line. It makes navigating around code easier.
vim.wo.number = true
vim.wo.relativenumber = true

-- Do not save when switching buffers (note: default on master).
vim.o.hidden = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.smartindent = true

-- No backups
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.noswapfiles = true

-- Save undo history.
vim.opt.undofile = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time.
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Show line diagnostics automatically in hover window
vim.diagnostic.config({ virtual_text = false })
vim.cmd([[ 
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
]])

-- Autowrite and autoread files
vim.o.autowrite = true
vim.o.autoread = true

-- Split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- Lazy redraw when macro working
vim.o.lazyredraw = true

-- autowrite on buf leave
-- au FocusLost,WinLeave * :silent! noautocmd wa
-- vim.api.nvim_create_autocmd(
--   { "FocusLost", "WinLeave" },
--   { pattern = { "*" }, command = "silent! noautocmd wa" }
-- )

-- Set colorscheme defaults (order is important here).
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd([[ colorscheme gruvbox-material ]])

-- Hide ~ at the end of file
vim.o.fillchars = "eob: "

-- Transparency
vim.o.pumblend = 10
vim.o.winblend = 10

-- Highlight on yank
vim.api.nvim_exec(
  [[
    augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
    augroup END
  ]],
  false
)

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

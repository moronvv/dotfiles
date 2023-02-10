require("keybindings")
require("plugins")
require("style")
require("spellcheck")

require("plugs.lsp")
require("plugs.xkbswitch")
require("plugs.oil")
require("plugs.lualine")
require("plugs.treesitter")
require("plugs.cmp")
require("plugs.telescope")
require("plugs.gitsigns")
require("plugs.fugitive")
require("plugs.auto-save")
require("plugs.indent-blankline")
require("plugs.todo-comments")
require("plugs.stay-centered")

-- relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- enable break indent
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.smartindent = true

-- no backups
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- save undo history.
vim.opt.undofile = true

-- case insensitive searching unless /C or capital in search.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- decrease update time.
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- lazy redraw when macro working
vim.opt.lazyredraw = true

-- hide mode below statusline
vim.opt.showmode = false

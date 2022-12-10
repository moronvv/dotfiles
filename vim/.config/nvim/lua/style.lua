-- set colorscheme defaults (order is important here).
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("catppuccin-macchiato")
LualineColorscheme = "catppuccin"

-- hide ~ at the end of file
vim.opt.fillchars = "eob: "

-- transparency
vim.opt.pumblend = 10
vim.opt.winblend = 10
require("transparent").setup({ enable = true })
vim.cmd([[ 
  hi link TelescopeNormal NormalFloat
  hi link TelescopeBorder FloatBorder
]])

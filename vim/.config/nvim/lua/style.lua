-- set colorscheme defaults (order is important here).
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd([[ colorscheme gruvbox-material ]])

-- Hide ~ at the end of file
vim.opt.fillchars = "eob: "

-- Transparency
vim.opt.pumblend = 10
vim.opt.winblend = 10

-- show line diagnostics automatically in hover window
vim.diagnostic.config({ virtual_text = false })
vim.cmd([[ 
  autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
]])

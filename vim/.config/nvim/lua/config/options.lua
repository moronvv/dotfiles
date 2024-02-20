-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- root dir detection
vim.g.root_spec = { { ".git", "lua" }, "cwd" }

-- python binary path for python provider
vim.g.python3_host_prog = "~/.pyenv/shims/python3"

local opt = vim.opt

opt.spelllang = { "en", "ru" }

-- turn off swapfiles
opt.swapfile = false

-- hide ~ at the end of file
---@diagnostic disable-next-line: assign-type-mismatch
opt.fillchars = "eob: "

-- do not insert the current comment leader after hitting 'o' or 'O' in Normal mode
opt.formatoptions:remove({ "o" })

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- root dir detection
vim.g.root_spec = { { ".git", "lua" }, "cwd" }

-- use basedpyright instead of original pyright
vim.g.lazyvim_python_lsp = "basedpyright"

-- spelling languages
vim.opt.spelllang = { "en", "ru" }

-- turn off swapfiles
vim.opt.swapfile = false

-- hide ~ at the end of file
---@diagnostic disable-next-line: assign-type-mismatch
vim.opt.fillchars = "eob: "

-- do not insert the current comment leader after hitting 'o' or 'O' in Normal mode
vim.opt.formatoptions:remove({ "o" })

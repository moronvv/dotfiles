-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.spelllang = { "en", "ru" }

-- hide ~ at the end of file
---@diagnostic disable-next-line: assign-type-mismatch
opt.fillchars = "eob: "

-- do not insert the current comment leader after hitting 'o' or 'O' in Normal mode
opt.formatoptions:remove({ "o" })

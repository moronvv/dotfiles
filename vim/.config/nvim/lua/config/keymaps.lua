-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- fix exiting insert mode when in russian layout
vim.keymap.set("i", "<C-х>", "<esc>")

-- create command to copy current buffer's path
vim.api.nvim_create_user_command("CopyRelPath", "call setreg('+', expand('%'))", {})

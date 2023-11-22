-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

if Util.has("bufferline.nvim") then
  -- keys for moving buffers left and right
  vim.keymap.set("n", "<A-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer left" })
  vim.keymap.set("n", "<A-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer right" })
end

-- fix exiting insert mode when in russian layout
vim.keymap.set("i", "<C-х>", "<esc>")

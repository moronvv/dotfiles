-- Remap space as leader key.
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with word wrap and keep screen centered.
vim.keymap.set("n", "k", "v:count == 0 ? 'gkzz' : 'kzz'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gjzz' : 'jzz'", { expr = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<S-g>", "<S-g>zz")

-- Remap for easy windows hopping
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>")

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

-- pdb breakpoint
vim.api.nvim_exec(
  [[autocmd FileType python nnoremap <buffer> <leader>b Obreakpoint()<Esc>]],
  false
)

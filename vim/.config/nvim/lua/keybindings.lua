-- Remap space as leader key.
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap for dealing with word wrap and keep screen centered.
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

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

-- python breakpoint
vim.api.nvim_exec(
  [[autocmd FileType python nnoremap <buffer> <leader>b Obreakpoint()<Esc>]],
  false
)

-- go breakpoint
vim.api.nvim_exec(
  [[autocmd FileType go nnoremap <buffer> <leader>b Oruntime.Breakpoint()<Esc>]],
  false
)

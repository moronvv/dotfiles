vim.opt.diffopt:append("vertical")

-- save all buffers and open fugitive git status
vim.keymap.set("n", "<space>gs", ":wa | :Git<CR>", { noremap = true, silent = true })

-- no wrap for git commit long messages
vim.api.nvim_exec(
  [[
    augroup NoWrap
      autocmd!
      autocmd Filetype gitcommit set formatoptions-=tl
    augroup END
  ]],
  false
)

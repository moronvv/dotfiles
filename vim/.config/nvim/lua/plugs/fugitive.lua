vim.opt.diffopt:append("vertical")

vim.keymap.set("n", "<space>gs", ":Git<CR>", { noremap = true, silent = true })

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

-- spellcheck for md files
vim.api.nvim_exec(
  [[autocmd FileType markdown setlocal spell spelllang=ru_ru,en_us]],
  false
)

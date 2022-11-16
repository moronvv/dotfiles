-- indentLine

-- turn off conceal for specific files
vim.api.nvim_create_autocmd(
  "Filetype",
  { pattern = { "json", "markdown" }, command = [[ let g:indentLine_setConceal = 0 ]] }
)

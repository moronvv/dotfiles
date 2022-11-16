-- lightline

-- Set status bar settings.
vim.g.lightline = {
  colorscheme = 'nightfly',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

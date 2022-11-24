-- lualine

require('lualine').setup {
  options = {
    theme = 'gruvbox-material',
    section_separators = '',
    component_separators = '|',
    icons_enabled = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}

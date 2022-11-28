require("lualine").setup {
  options = {
    theme = "gruvbox-material",
    section_separators = "",
    component_separators = "|",
    icons_enabled = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "lsp_progress" },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
}

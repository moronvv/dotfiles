return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- icons
  },
  opts = {
    options = {
      theme = vim.g.statusline_colorscheme,
      section_separators = "",
      component_separators = "|",
      icons_enabled = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = { "filetype" },
      lualine_z = { "location" },
    },
  },
}

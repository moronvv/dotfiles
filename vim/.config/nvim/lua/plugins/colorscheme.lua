THEME = "catppuccin" -- edit this to change theme

COLORSCHEMES_CONF_MAP = {
  ["catppuccin"] = {
    plugin = "catppuccin/nvim",
    alias = "catppuccin",
    colorscheme = "catppuccin-macchiato",
    statusline_colorscheme = "catppuccin",
  },
  ["gruvbox-material"] = {
    plugin = "sainnhe/gruvbox-material",
    alias = "gruvbox-material",
    colorscheme = "gruvbox-material",
    statusline_colorscheme = "gruvbox-material",
  },
  ["rose-pine"] = {
    plugin = "rose-pine/neovim",
    alias = "rose-pine",
    colorscheme = "rose-pine",
    statusline_colorscheme = "rose-pine",
  },
}
CONF = COLORSCHEMES_CONF_MAP[THEME]

return {
  -- "sainnhe/gruvbox-material"
  -- "catppuccin/nvim"
  CONF["plugin"],
  name = CONF["alias"],
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- set colorscheme defaults (order is important here).
    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    vim.cmd.colorscheme(CONF["colorscheme"])
    vim.g.statusline_colorscheme = CONF["statusline_colorscheme"]
  end,
}

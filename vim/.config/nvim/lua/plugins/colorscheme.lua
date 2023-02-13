return {
  -- { "rose-pine/neovim", name = "rose-pine" },
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- set colorscheme defaults (order is important here).
    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    vim.cmd.colorscheme("catppuccin-macchiato")
    vim.g.statusline_colorscheme = "catppuccin"
  end,
}

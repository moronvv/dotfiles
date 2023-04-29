return {
  "xiyaowong/transparent.nvim", -- transparency
  config = function()
    require("transparent").setup({
      extra_groups = {
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
      },
      exclude_groups = {},
    })

    vim.opt.pumblend = 10
    vim.opt.winblend = 10
  end,
}

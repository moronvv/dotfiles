return {
  "xiyaowong/transparent.nvim", -- transparency
  config = function()
    require("transparent").setup({
      extra_groups = {
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
      },
    })

    vim.opt.pumblend = 10
    vim.opt.winblend = 10
  end,
}

return {
  "xiyaowong/transparent.nvim", -- transparency
  config = function()
    require("transparent").setup()

    vim.opt.pumblend = 10
    vim.opt.winblend = 10
  end,
}

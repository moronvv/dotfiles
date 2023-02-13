return {
  "xiyaowong/nvim-transparent", -- transparency
  config = function()
    require("transparent").setup({ enable = true })

    vim.opt.pumblend = 10
    vim.opt.winblend = 10
  end,
}

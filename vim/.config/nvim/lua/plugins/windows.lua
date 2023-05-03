return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.opt.wrap = false -- turn off text wrap
    vim.opt.sidescrolloff = 999 -- keep screen centered horizontally

    vim.opt.winwidth = 6
    vim.opt.winminwidth = 6
    vim.opt.equalalways = false

    require("windows").setup({
      autowidth = {
        enable = true,
        winwidth = 999,
        filetype = {
          help = 999,
        },
      },
    })
  end,
}

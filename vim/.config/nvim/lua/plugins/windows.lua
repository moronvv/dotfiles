return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.opt.wrap = false
    vim.opt.winwidth = 10
    vim.opt.winminwidth = 10
    vim.opt.equalalways = false

    require("windows").setup({
      autowidth = { --		       |windows.autowidth|
        enable = true,
        winwidth = 999, --		        |windows.winwidth|
        filetype = { --	      |windows.autowidth.filetype|
          help = 999,
        },
      },
    })
  end,
}

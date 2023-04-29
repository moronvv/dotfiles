return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- icons
  },
  init = function()
    vim.keymap.set(
      "n",
      "<leader>xx",
      ":TroubleToggle<CR>",
      { silent = true, noremap = true }
    )
  end,
  cmd = "TroubleToggle",
  config = function()
    require("trouble").setup()
  end,
}

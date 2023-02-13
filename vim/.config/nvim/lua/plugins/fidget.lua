return {
  "j-hui/fidget.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("fidget").setup({
      window = {
        blend = 0,
        border = "solid",
      },
    })
  end,
}

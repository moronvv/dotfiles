return {
  "folke/flash.nvim",
  -- stylua: ignore
  keys = {
    { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "s", false },
    { "r", false },
    { "R", false },
  },
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
}

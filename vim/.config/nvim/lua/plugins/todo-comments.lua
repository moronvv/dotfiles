return {
  "folke/todo-comments.nvim",
  dependencies = {
    "BurntSushi/ripgrep",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("todo-comments").setup({
      signs = false,
    })

    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    vim.keymap.set(
      "n",
      "<leader>st",
      ":TodoTelescope<CR>",
      { noremap = true, silent = true }
    )
  end,
}

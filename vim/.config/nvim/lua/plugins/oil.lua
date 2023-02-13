return {
  -- "prichrd/netrw.nvim", -- fancy netrw
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- icons
  },
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["g."] = "actions.toggle_hidden",
      },
      use_default_keymaps = false,
    })

    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}

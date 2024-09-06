return {
  "LintaoAmons/scratch.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
  },
  keys = {
    { "<leader>Sn", "<cmd>Scratch<cr>", desc = "New scratch file" },
    { "<leader>So", "<cmd>ScratchOpen<cr>", desc = "Open existing scratch file" },
  },
  opts = {
    file_picker = "telescope",
    filetypes = { "json", "txt", "yaml", "py" },
  },
}

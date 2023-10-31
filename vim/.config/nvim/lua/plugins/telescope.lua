return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "node_modules/", "vendor/", "/usr/" },
      mappings = {
        i = {
          ["<C-[>"] = require("telescope.actions").close,
          ["<C-s>"] = require("telescope.actions").file_split,
          ["<C-c>"] = false,
          ["<C-x>"] = false,
        },
      },
    },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          "node_modules",
          "vendor",
          "elasticmappings",
        },
        always_show = {
          ".env",
        },
      },
      window = {
        mappings = {
          -- disable fuzzy finder
          ["/"] = "noop",
        },
      },
    },
    event_handlers = {

      {
        event = "file_opened",
        handler = function(_)
          -- auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}

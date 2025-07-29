return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local config = require("fzf-lua.config")

    config.defaults.keymap.builtin["<c-d>"] = "preview-page-down"
    config.defaults.keymap.builtin["<c-u>"] = "preview-page-up"
  end,
}

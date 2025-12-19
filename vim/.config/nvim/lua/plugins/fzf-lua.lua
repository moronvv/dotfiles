return {
  "ibhagwan/fzf-lua",
  opts = {
    fzf_opts = {
      ["--history"] = vim.fn.stdpath("data") .. "/fzf-history",
    },
    keymap = {
      builtin = {
        ["<c-d>"] = "preview-page-down",
        ["<c-u>"] = "preview-page-up",
      },
    },
  },
}

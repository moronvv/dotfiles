require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    "javascript",
    "typescript",
    "go",
    "c",
    "cpp",
    "lua",
    "html",
    "css",
    "bash",
    "json",
    "yaml",
    "sql",
    "gitignore",
    "make",
    "markdown",
    "toml",
    "vim",
    "help",
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = { enable = true, disable = { "python" } },
  endwise = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  include_surrounding_whitespace = true,
})

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
    "RRethy/nvim-treesitter-endwise",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "python",
        "javascript",
        "typescript",
        "haskell",
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
        "gitcommit",
        "diff",
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
  end,
}

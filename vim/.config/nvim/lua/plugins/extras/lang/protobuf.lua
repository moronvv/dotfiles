-- stylua: ignore
if true then return {} end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "proto" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "buf-language-server", "buf" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bufls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        proto = { "buf" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        proto = { "buf_lint" },
      },
    },
  },
}

return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "debugpy",
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "black", "isort", "autoflake" })
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        python = { "black", "isort", "autoflake" },
      },
      formatters = {
        isort = {
          prepend_args = { "--profile", "black" },
        },
        autoflake = {
          prepend_args = { "--remove-all-unused-imports", "--ignore-init-module-imports" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {
          init_options = {
            settings = {
              args = {
                "--select",
                "E4,E7,E9,F",
              },
            },
          },
        },
      },
    },
  },
}

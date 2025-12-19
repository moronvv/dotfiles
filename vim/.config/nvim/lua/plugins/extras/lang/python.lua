return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "ruff" })
        end,
      },
    },
    opts = {
      formatters = {
        ruff_format = {
          append_args = { "--line-length", "120" },
        },
        ruff_fix = {
          append_args = { "--ignore", "D,PT001,PT023" },
        },
      },
      formatters_by_ft = {
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                  reportInvalidTypeForm = "none",
                },
              },
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              lint = {
                select = {
                  "E4",
                  "E7",
                  "E9",
                  "F",
                },
              },
            },
          },
        },
      },
    },
  },
}

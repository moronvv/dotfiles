return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "goimports", "goimports-reviser", "gofumpt" })
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        go = { "gofumpt", "goimports", "goimports-reviser" },
      },
      formatters = {
        ["goimports-reviser"] = {
          prepend_args = { "-set-alias" },
        },
      },
    },
  },
}

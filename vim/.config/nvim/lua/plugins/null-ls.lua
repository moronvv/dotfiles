return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    -- formatters configuration
    local builtins = {
      diagnostics = {
        djlint = {},
      },
      formatting = {
        black = {},
        isort = { "--profile", "black" },
        autoflake = {
          extra_args = { "--remove-all-unused-imports", "--ignore-init-module-imports" },
        },
        goimports_reviser = {
          extra_args = { "-rm-unused", "-set-alias" },
        },
        sql_formatter = {
          extra_args = { "--language", "postgresql" },
        },
        prettier = {},
        stylua = {
          extra_args = {
            "--column-width",
            "88",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        },
      },
    }
    local sources = {}
    for type, srcs in pairs(builtins) do
      for src, conf in pairs(srcs) do
        table.insert(sources, null_ls.builtins[type][src].with(conf))
      end
    end

    require("mason").setup()
    null_ls.setup({
      sources = sources,
    })
    require("mason-null-ls").setup({
      ensure_installed = nil,
      automatic_installation = true,
    })
  end,
}

-- stylua: ignore
if true then return {} end

return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    cmd = "DBUI",
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
          "mysql",
          "plsql",
        },
        callback = function()
          local cmp = require("cmp")
          opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "vim-dadbod-completion" } }))
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "sql",
      },
    },
  },
}

local nvim_lsp = require("lspconfig")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<space>sh", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- formatters configuration
local formatters = {
  black = { formatCommand = "black --quiet -", formatStdin = true },
  isort = { formatCommand = "isort --profile black -", formatStdin = true },
  prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
  },
  djlint = { formatCommand = "djlint --reformat -", formatStdin = true },
  stylua = {
    formatCommand = "stylua --column-width=88 --indent-type=Spaces --indent-width=2 -",
    formatStdin = true,
  },
}
local ensure_installed_formatters = {}
for formatter, _ in pairs(formatters) do
  table.insert(ensure_installed_formatters, formatter)
end
local language_formatters = {
  python = { formatters.black, formatters.isort },
  lua = { formatters.stylua },
  javascript = { formatters.prettier },
  yaml = { formatters.prettier },
  json = { formatters.prettier },
  html = { formatters.prettier },
  markdown = { formatters.prettier },
  css = { formatters.prettier },
  toml = { formatters.prettier },
  htmldjango = { formatters.djlint },
}

-- language servers configuration
local servers = {
  efm = {
    filetypes = language_formatters,
    init_options = { documentFormatting = true },
    settings = { rootMarkers = { ".git/" }, languages = language_formatters },
  },
  pyright = {},
  tsserver = {},
  yamlls = { settings = { telemetry = { enabled = false } } },
  jsonls = { init_options = { provideFormatter = false } },
  html = {},
  marksman = {},
  bashls = {},
  dockerls = {},
  sumneko_lua = {
    settings = {
      Lua = {
        format = { enable = false },
        runtime = { version = "LuaJIT", path = runtime_path },
        diagnostics = { globals = { "vim", "use" } },
        telemetry = { enable = false },
      },
    },
  },
}

require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = ensure_installed_formatters,
  auto_update = true,
  run_on_start = true,
})
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- init language servers
for server, confs in pairs(servers) do
  nvim_lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = confs.filetypes,
    init_options = confs.init_options,
    settings = confs.settings,
  })
end

-- Set completeopt to have a better completion experience
-- vim.o.completeopt = 'menu,noselect,preview'
vim.opt.completeopt = { "menu", "noselect", "preview" }

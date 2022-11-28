local telescope = require("telescope")
local fzf_opts = {
  fuzzy = true, -- false will only do exact matching
  override_generic_sorter = true, -- override the generic sorter
  override_file_sorter = true, -- override the file sorter
  case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  -- the default case_mode is "smart_case"
}

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-[>"] = require("telescope.actions").close,
        ["<C-s>"] = require("telescope.actions").file_split,
        ["<C-u>"] = false,
        ["<C-d>"] = false,
        ["<C-c>"] = false,
        ["<C-x>"] = false,
      },
    },
  },
  pickers = {
    -- Manually set sorter, for some reason not picked up automatically
    lsp_dynamic_workspace_symbols = {
      sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts),
    },
  },
  extensions = { fzf = fzf_opts },
}

telescope.load_extension("fzf")

-- Add leader shortcuts
local builtin = require("telescope.builtin")
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader><space>", builtin.find_files, opts)
vim.keymap.set("n", "<leader>sw", builtin.lsp_dynamic_workspace_symbols, opts)
vim.keymap.set("n", "<leader>so", builtin.lsp_document_symbols, opts)
vim.keymap.set("n", "<leader>sp", builtin.live_grep, opts)

vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
vim.keymap.set("n", "gtd", builtin.lsp_type_definitions, opts)
vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
vim.keymap.set("n", "gr", builtin.lsp_references, opts)
vim.keymap.set(
  "n", "<space>sd", function() builtin.diagnostics({ bufnr = 0 }) end, opts
)

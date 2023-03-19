return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons", -- icons
  },
  config = function()
    local telescope = require("telescope")
    local fzf_opts = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
    local ignore_patterns = { ".git/", "node_modules/" }

    telescope.setup({
      defaults = {
        file_ignore_patterns = ignore_patterns,
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
    })

    telescope.load_extension("fzf")

    -- Add leader shortcuts
    local builtin = require("telescope.builtin")
    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<leader><space>", function()
      builtin.find_files({ hidden = true })
    end, opts)
    vim.keymap.set("n", "<leader>sw", builtin.lsp_dynamic_workspace_symbols, opts)
    vim.keymap.set("n", "<leader>so", builtin.lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>sp", builtin.live_grep, opts)
    vim.keymap.set("n", "<leader>fb", function()
      builtin.buffers({ sort_mru = true })
    end, opts)

    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gtd", builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
    vim.keymap.set("n", "gr", function()
      builtin.lsp_references({ sort_mru = true })
    end, opts)
    vim.keymap.set("n", "<space>sd", function()
      builtin.diagnostics({ bufnr = 0 })
    end, opts)
  end,
}

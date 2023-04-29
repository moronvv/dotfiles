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
    local ignore_patterns = { ".git/", "node_modules/", "vendor/", "/usr/" }

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
    local themes = require("telescope.themes")
    local opts = { noremap = true, silent = true }

    -- helper for applying theme to all pickers
    local call_telescope = function(input, opts)
      local theme = themes.get_dropdown(opts)
      input(theme)
    end

    vim.keymap.set("n", "<leader><space>", function()
      call_telescope(builtin.find_files, { hidden = true })
    end, opts)
    vim.keymap.set("n", "<leader>sw", function()
      call_telescope(builtin.lsp_dynamic_workspace_symbols)
    end, opts)
    vim.keymap.set("n", "<leader>so", function()
      call_telescope(builtin.lsp_document_symbols)
    end, opts)
    vim.keymap.set("n", "<leader>sp", function()
      call_telescope(builtin.live_grep)
    end, opts)
    vim.keymap.set("n", "<leader>fb", function()
      call_telescope(builtin.buffers, { sort_mru = true })
    end, opts)

    -- lsp
    vim.keymap.set("n", "gd", function()
      call_telescope(builtin.lsp_definitions)
    end, opts)
    vim.keymap.set("n", "gtd", function()
      call_telescope(builtin.lsp_type_definitions)
    end, opts)
    vim.keymap.set("n", "gi", function()
      call_telescope(builtin.lsp_implementations)
    end, opts)
    vim.keymap.set("n", "gr", function()
      call_telescope(builtin.lsp_references, { sort_mru = true })
    end, opts)
    vim.keymap.set("n", "<space>sd", function()
      call_telescope(builtin.diagnostics, { bufnr = 0 })
    end, opts)
  end,
}

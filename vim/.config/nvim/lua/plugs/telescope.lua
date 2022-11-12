-- Telescope

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-[>'] = require('telescope.actions').close,
        ['<C-s>'] = require('telescope.actions').file_split,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-x>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

-- Add leader shortcuts
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader><space>',
  [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], opts)
vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
  opts)
vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)

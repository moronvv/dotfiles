vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- fix ctrl+l window switch
vim.keymap.set("n", "<leader>gnl", "<Plug>NetrwRefresh")

require("netrw").setup({ use_devicons = true })

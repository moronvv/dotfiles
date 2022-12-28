vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- dont add netrw buffers to jumplist
vim.g.netrw_altfile = 1

-- fix ctrl+l window switch
vim.keymap.set("n", "<leader>gnl", "<Plug>NetrwRefresh")

require("netrw").setup({ use_devicons = true })

-- Fugitive

vim.opt.diffopt:append('vertical')

vim.keymap.set('n', '<space>gs', ':Git<CR>', { noremap = true, silent = true })

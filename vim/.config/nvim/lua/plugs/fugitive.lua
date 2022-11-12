-- Fugitive

vim.o.diffopt = 'vertical'

vim.keymap.set('n', '<space>gs', ':Git<CR>', { noremap = true, silent = true })

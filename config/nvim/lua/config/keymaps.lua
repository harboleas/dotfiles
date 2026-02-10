vim.keymap.set('n', '<leader>h', ':noh<cr>', {silent = true, desc = 'Stop the highlighting for search'})

-- Moverse entre ventanas con Ctl + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Redimensionar ventanas con Alt + hjkl
vim.keymap.set('n', '<M-h>', ':vertical resize -2<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', ':resize -2<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':resize +2<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', ':vertical resize +2<CR>', { silent = true })

-- Dividir las ventanas 
vim.keymap.set('n', '<leader>wh', ':split<cr>', {silent = true, desc = 'Split Window Horiz'})
vim.keymap.set('n', '<leader>wv', ':vsplit<cr>', {silent = true, desc = 'Split Window Vert'})

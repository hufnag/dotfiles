local bind = vim.keymap.set
bind('i', 'kj', '<Esc>')

-- Move over visual lines
bind('n', 'j', 'gj')
bind('n', 'k', 'gk')

bind('n', 'ß', '$')
bind('n', 'Y', 'y$')
bind('n', 'n', 'nzzzv')
bind('n', 'N', 'Nzzzv')
bind('n', 'J', 'mzJ`z')

bind('v', 'J', ":m '>+1<CR>gv=gv")
bind('v', 'K', ":m '<-2<CR>gv=gv")
bind('i', '<C-j>', '<esc>:m .+1<CR>==')
bind('i', '<C-k>', '<esc>:m .-2<CR>==')
bind('n', '<leader>J', ':m .+1<CR>==')
bind('n', '<leader>K', ':m .-2<CR>==')
-- bind('n', '<leader>k', ':set nowrap!')
bind('n', '<leader>#', ':noh<CR>', { silent = true })

bind('n', '<M-l>', ':bn!<CR>', { silent = true })
bind('n', '<M-h>', ':bp!<CR>', { silent = true })
bind('n', '<M-d>', ':bp<bar>bd #<CR>', { silent = true })
bind('n', '<leader><M-d>', ':bp<bar>bd! #<CR>', { silent = true })

bind('c', '<C-p>', '<Up>')
bind('c', '<C-n>', '<Down>')
bind('c', '<Up>', '<C-p>')
bind('c', '<Down>', '<C-n>')
bind('n', 'ä', ':Outline<CR>')

bind('n', 'gn', vim.diagnostic.goto_prev)
bind('n', 'gN', vim.diagnostic.goto_next)
bind('n', '<leader>s', vim.diagnostic.open_float)
bind('n', '<leader>q', vim.diagnostic.setloclist)
bind('n', '<Space><Space>', ':Telescope<CR>', {})
bind('n', '<leadeR>b', ':DapToggleBreakpoint<CR>', {})
bind('n', 'gd', ':DapContinue<CR>', {})
bind('n', 'go', ':DapStepOver<CR>', {})
bind('n', 'gi', ':DapStepInto<CR>', {})

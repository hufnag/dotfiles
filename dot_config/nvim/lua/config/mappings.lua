local bind = vim.keymap.set
bind("i", "kj", "<Esc>")

-- Move over visual lines
bind("n", "j", "gj")
bind("n", "k", "gk")

bind("n", "ß", "$", { desc = "Go to end of line" })
bind("n", "Y", "y$", { desc = "Yank to end of line" })
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")
bind("n", "J", "mzJ`z")

local function diagnostic_jump(count, severity)
	return function()
		vim.diagnostic.jump({ count = count, severity = severity })
	end
end

bind("n", "üd", diagnostic_jump(-1), { desc = "Previous diagnostic" })
bind("n", "+d", diagnostic_jump(1), { desc = "Next diagnostic" })
bind("n", "üe", diagnostic_jump(-1, vim.diagnostic.severity.ERROR), { desc = "Previous error" })
bind("n", "+e", diagnostic_jump(1, vim.diagnostic.severity.ERROR), { desc = "Next error" })
bind("n", "üw", diagnostic_jump(-1, vim.diagnostic.severity.WARN), { desc = "Previous warning" })
bind("n", "+w", diagnostic_jump(1, vim.diagnostic.severity.WARN), { desc = "Next warning" })

bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")
bind("i", "<C-j>", "<esc>:m .+1<CR>==")
bind("i", "<C-k>", "<esc>:m .-2<CR>==")
bind("n", "<leader>J", ":m .+1<CR>==")
bind("n", "<leader>K", ":m .-2<CR>==")
-- bind('n', '<leader>k', ':set nowrap!')
bind("n", "<leader>#", ":noh<CR>", { silent = true })

bind("n", "L", ":bn!<CR>", { silent = true })
bind("n", "H", ":bp!<CR>", { silent = true })
bind("n", "<M-d>", ":bp<bar>bd #<CR>", { silent = true })
bind("n", "<leader><M-d>", ":bp<bar>bd! #<CR>", { silent = true })

bind("c", "<C-p>", "<Up>", { desc = "Previouse Cmd" })
bind("c", "<C-n>", "<Down>", { desc = "Next Cmd" })

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save with formatting" })
vim.keymap.set("n", "<leader>W", "<cmd>noautocmd write<cr>", { desc = "Save without formatting" })
-- bind("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
-- bind('c', '<Up>', '<C-p>')
-- bind('c', '<Down>', '<C-n>')
-- bind('n', 'ä', ':Outline<CR>')

-- bind('n', '<leader>s', vim.diagnostic.open_float)
-- bind('n', '<leader>q', vim.diagnostic.setloclist)
-- bind('n', '<leadeR>b', ':DapToggleBreakpoint<CR>', {})
-- bind('n', 'gd', ':DapContinue<CR>', {})
-- bind('n', 'go', ':DapStepOver<CR>', {})
-- bind('n', 'gi', ':DapStepInto<CR>', {})

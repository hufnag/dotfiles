local bind = vim.keymap.set
bind("i", "kj", "<Esc>")

-- Move over visual lines
bind("n", "j", "gj")
bind("n", "k", "gk")

bind("n", "ß", "$", { desc = "Go to end of line" })
bind("n", "Y", "y$", { desc = "Yank to end of line" })
bind("n", "n", "nzzzv", { desc = "Next search result" })
bind("n", "N", "Nzzzv", { desc = "Previous search result" })
bind("n", "*", "#", { desc = "Search word backward" })
bind("n", "#", "*", { desc = "Search word forward" })
bind("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

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

bind("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
bind("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })
bind("i", "<C-j>", "<esc>:m .+1<CR>==", { desc = "Move current line down" })
bind("i", "<C-k>", "<esc>:m .-2<CR>==", { desc = "Move current line up" })
bind("n", "<leader>J", ":m .+1<CR>==", { desc = "Move current line down" })
bind("n", "<leader>K", ":m .-2<CR>==", { desc = "Move current line up" })
bind("n", "<leader>k", ":set nowrap!<CR>", { desc = "Toggle wrap" })
bind("n", "<leader>#", ":noh<CR>", { silent = true, desc = "Clear search highlight" })

bind("n", "L", ":bn!<CR>", { silent = true, desc = "Next Buffer" })
bind("n", "H", ":bp!<CR>", { silent = true, desc = "Previous Buffer" })
bind("n", "<M-d>", function()
	Snacks.bufdelete()
end, { desc = "Delete current buffer" })
bind("n", "<M-D>", function()
	Snacks.bufdelete.invisible()
end, { desc = "Delete all invisible buffers" })

bind("c", "<C-p>", "<Up>", { desc = "Previouse Cmd" })
bind("c", "<C-n>", "<Down>", { desc = "Next Cmd" })

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save with formatting" })
vim.keymap.set("n", "<leader>W", "<cmd>noautocmd write<cr>", { desc = "Save without formatting" })

-- bind('n', '<leadeR>b', ':DapToggleBreakpoint<CR>', {})
-- bind('n', 'gd', ':DapContinue<CR>', {})
-- bind('n', 'go', ':DapStepOver<CR>', {})
-- bind('n', 'gi', ':DapStepInto<CR>', {})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.sh.tmpl",
	callback = function()
		vim.bo.filetype = "sh"
	end,
})

-- Create parent directories automatically
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Create parent directories on save",
	callback = function(event)
		local file = event.match

		-- Ignore special buffers / URLs
		if file:match("^%w%w+://") then
			return
		end

		local dir = vim.fn.fnamemodify(file, ":p:h")

		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Go to last loc when opening a buffer",
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Resize splits if window got resized",
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	desc = "Check if file needs to be reloaded",
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	callback = function()
		if vim.fn.has("nvim-0.13") == 1 then
			vim.hl.hl_op()
		else
			(vim.hl or vim.highlight).on_yank()
		end
	end,
})

-- Spellchecking
vim.api.nvim_create_autocmd("FileType", {
	desc = "Enable spellchecking only for specific file types",
	pattern = {
		"markdown",
		"text",
		"gitcommit",
		"latex",
		"tex",
	},
	callback = function()
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	desc = "Show diagnostics in a floating window",
	group = vim.api.nvim_create_augroup("diagnostic_float", { clear = true }),
	callback = function()
		if vim.diagnostic.is_enabled and not vim.diagnostic.is_enabled({ bufnr = 0 }) then
			return
		end

		local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
		if #diagnostics == 0 then
			return
		end

		vim.diagnostic.open_float(nil, {
			scope = "line",
			focusable = false,
			border = "rounded",
			source = "if_many",
		})
	end,
})

vim.g.mapleader = "ö"
vim.g.maplocalleader = "ö"

vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.laststatus = 3
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.showmode = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.mouse = "a"
vim.opt.mousemodel = "extend"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "list", "full" }
vim.opt.undofile = true

-- Case insensitive file and directory completion
vim.opt.wildignorecase = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.confirm = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

vim.opt.hlsearch = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.diffopt:append("linematch:60")

vim.filetype.add({
	extension = {
		overlay = "overlay",
	},
})

vim.opt.spelllang = { "en_us", "de_de" }
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
vim.opt.spelloptions = "camel"

-- local function set_undercurl_highlights()
-- 	local spell_undercurl = {
-- 		undercurl = true,
-- 		sp = "#fabd2f", -- yellow
-- 	}
--
-- 	for _, group in ipairs({ "SpellBad", "SpellCap", "SpellRare", "SpellLocal" }) do
-- 		vim.api.nvim_set_hl(0, group, spell_undercurl)
-- 	end
--
-- 	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
-- 		undercurl = true,
-- 		sp = "#fb4934",
-- 	})
-- 	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
-- 		undercurl = true,
-- 		sp = "#fabd2f",
-- 	})
-- 	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", {
-- 		undercurl = true,
-- 		sp = "#83a598",
-- 	})
-- 	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", {
-- 		undercurl = true,
-- 		sp = "#8ec07c",
-- 	})
-- end

-- set_undercurl_highlights()
--
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = set_undercurl_highlights,
-- })
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

vim.keymap.set("n", "<leader>e", function()
	local line = vim.fn.line(".") - 1
	local diagnostics = vim.diagnostic.get(0, { lnum = line })

	if #diagnostics > 0 then
		vim.diagnostic.open_float(nil, {
			scope = "line",
			border = "rounded",
			focusable = false,
		})
		return
	end

	local spell = vim.fn.spellbadword()
	local word = spell[1]
	local kind = spell[2]

	if word ~= "" then
		local messages = {
			bad = "Spelling mistake",
			caps = "Capitalization issue",
			rare = "Rare word",
			local_ = "Word valid in another region",
		}

		vim.notify((messages[kind] or "Spelling issue") .. ": " .. word .. "\nUse z= for suggestions")
		return
	end

	vim.notify("No diagnostic or spelling issue found here")
end, { desc = "Explain underline/problem" })

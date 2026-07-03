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
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.spell = true
    end,
})

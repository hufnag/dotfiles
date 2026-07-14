return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,

		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
		},

		config = function(_, opts)
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldcolumn = "0"
			vim.opt.foldtext = ""
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldnestmax = 4

			require("nvim-treesitter").setup(opts)

			local install = require("nvim-treesitter.install")

			install.update({ with_sync = false })

			local filetypes = {
				"bash",
				"c",
				"cpp",
				"css",
				"html",
				"javascript",
				"json",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"toml",
				"typescript",
				"typescriptreact",
				"vim",
				"xml",
				"yaml",
			}

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {},
	},
}

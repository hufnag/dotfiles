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
				"cpp",
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

			local treesitter = require("nvim-treesitter")
			treesitter.setup(opts)

			local install = require("nvim-treesitter.install")

			install.update({ with_sync = false })

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(event)
					local lang = vim.treesitter.language.get_lang(event.match) or event.match
					if pcall(vim.treesitter.start, event.buf, lang) then
						return
					end

					treesitter.install(lang):await(function()
						vim.schedule(function()
							if vim.api.nvim_buf_is_valid(event.buf) then
								pcall(vim.treesitter.start, event.buf, lang)
							end
						end)
					end)
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

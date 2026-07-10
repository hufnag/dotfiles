return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({
						async = true,
						lsp_format = "fallback",
					})
				end,
				mode = { "n", "v" },
				desc = "Format file",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				python = { "ruff_format" },

				c = { "clang_format" },
				cpp = { "clang_format" },

				cmake = { "gersemi" },

				sh = { "shfmt" },
				bash = { "shfmt" },

				markdown = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
			},

			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
		},
	},
}

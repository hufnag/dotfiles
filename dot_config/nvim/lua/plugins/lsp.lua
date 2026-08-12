return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
				},
			})

			vim.lsp.enable({
				"bashls",
				"basedpyright",
				"buf",
				"clangd",
				"lua_ls",
				"marksman",
				"neocmake",
				"pyright",
				"rust_analyzer",
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}

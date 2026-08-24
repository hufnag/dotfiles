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
					vim.keymap.set(
						"n",
						"<leader>d",
						Snacks.picker.lsp_definitions,
						{ buffer = event.buf, desc = "Go to definition" }
					)
					vim.keymap.set(
						"n",
						"<leader>r",
						Snacks.picker.lsp_references,
						{ buffer = event.buf, desc = "Go to references" }
					)
					vim.keymap.set(
						"n",
						"<leader>D",
						vim.lsp.buf.implementation,
						{ buffer = event.buf, desc = "Go to implementation" }
					)
					vim.keymap.set(
						"n",
						"<leader>h",
						vim.lsp.buf.hover,
						{ buffer = event.buf, desc = "Hover documentation" }
					)
					vim.keymap.set("n", "R", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename symbol" })
					vim.keymap.set("n", "<C-.>", function()
						local line = vim.api.nvim_win_get_cursor(0)[1]
						vim.lsp.buf.code_action({
							range = {
								start = { line, 0 },
								["end"] = { line, #vim.api.nvim_get_current_line() },
							},
						})
					end, { buffer = event.buf, desc = "Code action for current line" })
					vim.keymap.set("v", "<C-.>", vim.lsp.buf.code_action, {
						buffer = event.buf,
						desc = "Code action for selection",
					})
				end,
			})
		end,
	},
}

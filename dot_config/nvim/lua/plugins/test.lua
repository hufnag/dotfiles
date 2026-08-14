return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"orjangj/neotest-ctest",
		},
		opts = function()
			return {
				adapters = {
					require("neotest-ctest").setup({
						frameworks = { "catch2" },
					}),
				},
			}
		end,
		keys = {
			{
				"<leader>tt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run nearest test",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run tests in current file",
			},
			{
				"<leader>tl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Run last test(s)",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle test summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open()
				end,
				desc = "Open test output",
			},
		},
	},
}

return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "Ä", "<cmd>AerialToggle<cr>", desc = "Toggle symbol outline" },
			{ "{", "<cmd>AerialPrev<cr>", desc = "Previous symbol" },
			{ "}", "<cmd>AerialNext<cr>", desc = "Next symbol" },
		},
		opts = {
			backends = { "treesitter", "lsp", "markdown", "man" },
			layout = {
				default_direction = "prefer_right",
			},
		},
	},
}

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			-- notifier = { enabled = true, timeout = 3000 },
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			lazygit = { enabled = false },
			-- words = { enabled = true },
		},
		keys = {
			-- Top Pickers & Explorer
			{
				"<leader>b",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"ü",
				function()
					Snacks.picker.explorer()
				end,
				desc = "Explorer",
			},
		},
	},
}

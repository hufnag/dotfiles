return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = false },
			indent = { enabled = true },
			input = { enabled = true },
			-- notifier = { enabled = true, timeout = 3000 },
			picker = { enabled = false },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			lazygit = { enabled = false },
			-- words = { enabled = true },
		},
		keys = {
			-- Top Pickers & Explorer
			-- {
			-- 	"ü",
			-- 	function()
			-- 		Snacks.picker.explorer()
			-- 	end,
			-- 	desc = "Explorer",
			-- },
		},
	},
}

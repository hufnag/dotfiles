return {
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{ "<leader>gj", "<cmd>Gitsigns nav_hunk next<cr>", desc = "Next Git hunk" },
			{ "<leader>gk", "<cmd>Gitsigns nav_hunk prev<cr>", desc = "Previous Git hunk" },
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Git hunk" },
			{ "<leader>gi", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview Git hunk inline" },
			{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff current file" },
			{ "<leader>gb", "<cmd>Gitsigns blame_line full=true<cr>", desc = "Blame current line" },
		},
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		init = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.95
		end,
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}

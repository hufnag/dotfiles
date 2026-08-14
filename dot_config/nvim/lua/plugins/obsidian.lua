return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- use latest release, remove to use latest commit
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in 4.0.0
		workspaces = {
			{
				name = "default",
				path = "~/obsidian/default",
			},
		},
		picker = {
			name = "snacks.picker",
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.opt_local.conceallevel = 2
			end,
		})
	end,
}

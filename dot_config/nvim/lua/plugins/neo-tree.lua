return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			default_component_configs = {
				diagnostics = {
					highlights = {
						hint = "DiagnosticHint",
						info = "DiagnosticInfo",
						warn = "DiagnosticWarn",
						error = "DiagnosticError",
					},
				},
			},
		},
		keys = {
			{ "ü", "<cmd>Neotree toggle<cr>", desc = "Toggle NeoTree" },
		},
	},
}

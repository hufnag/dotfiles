return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {},

			automatic_enable = false,
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				-- LSPs
				"bashls",
				"basedpyright",
				"buf", -- Protobuf
				"clangd",
				"lua_ls",
				"marksman", -- Markdown
				"neocmake",
				"rust_analyzer",

				-- formatters
				"stylua",
				"clang-format",
				"shfmt",
				"prettier",
				"ruff",
				"gersemi", -- CMake formatter

				-- linters
				"shellcheck",
				"markdownlint",
			},
		},
	},
}

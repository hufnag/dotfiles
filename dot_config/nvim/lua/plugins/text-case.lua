return {
	"johmsalas/text-case.nvim",
	opts = {},
	keys = {
		{
			"<leader>cc",
			function()
				require("textcase").current_word("to_camel_case")
			end,
			desc = "Convert to camelCase",
		},
		{
			"<leader>cs",
			function()
				require("textcase").current_word("to_snake_case")
			end,
			desc = "Convert to snake_case",
		},
		{
			"<leader>cp",
			function()
				require("textcase").current_word("to_pascal_case")
			end,
			desc = "Convert to PascalCase",
		},
		{
			"<leader>cu",
			function()
				require("textcase").current_word("to_constant_case")
			end,
			desc = "Convert to PascalCase",
		},
	},
}

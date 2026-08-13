return {
	{
		"Badhi/nvim-treesitter-cpp-tools",
		ft = "cpp",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = function()
			return {
				source_extension = "cc",
				custom_define_class_function_commands = {
					TSCppImplWrite = {
						output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
					},
				},
			}
		end,
		keys = {
			{
				"<leader>ci",
				"<cmd>TSCppImplWrite<cr>",
				desc = "Implement C++ function",
			},
			{
				"<leader>ci",
				":TSCppImplWrite<cr>",
				mode = "x",
				desc = "Implement C++ functions",
			},
		},
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				"<space><space>",
				function()
					require("telescope.builtin").builtin()
				end,
				desc = "Telescope",
			},
			{
				"<space>f",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files",
			},
			{
				"<space>h",
				function()
					require("telescope.builtin").find_files({
						cwd = vim.fn.expand("$HOME"),
						hidden = false,
					})
				end,
				desc = "Find files in $HOME",
			},
			{
				"<space>o",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Recent files",
			},
			{
				"<space>g",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Live grep",
			},
			{
				"<space>b",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Buffers",
			},
			{
				"<space>?",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Help tags",
			},
			{
				"<space>k",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<space>c",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Commands",
			},
			{
				"<space>2",
				function()
					require("telescope.builtin").registers()
				end,
				desc = "Registers",
			},
			{
				"<space>t",
				function()
					require("telescope").extensions.file_browser.file_browser({
						path = vim.fn.getcwd(),
						cwd = vim.fn.getcwd(),
						hidden = true,
					})
				end,
				desc = "File browser",
			},
			{
				"<space>m",
				function()
					require("telescope.builtin").man_pages()
				end,
				desc = "Man Pages",
			},
			{
				"<space>r",
				function()
					require("telescope.builtin").lsp_references()
				end,
				desc = "LSP References",
			},
			{
				"<leader>d",
				function()
					require("telescope.builtin").lsp_definitions()
				end,
				desc = "LSP Definitions",
			},
			{
				"<leader>s",
				function()
					require("telescope.builtin").spell_suggest()
				end,
				desc = "Spell suggest",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					path_display = { "smart" },

					mappings = {
						i = {
							-- ["<Esc>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							-- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<C-h>"] = "which_key",
						},
						n = {
							["q"] = actions.close,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},

				extensions = {
					fzf = {},
				},
			})

			telescope.load_extension("fzf")
		end,
	},
}

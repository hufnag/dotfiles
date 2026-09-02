return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = { contrast = "hard" },
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		---@module "oil"
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		-- Experimental plugin for modern UI look
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			notify = {
				enabled = true,
				view = "notify",
			},
			messages = {
				enabled = true,
				view = "mini",
				view_error = "notify",
				view_warn = "notify",
			},
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
	{
		-- Plugin for highlighting and managing TODO comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		-- Configures LuaLS for Neovim development
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Plugin for auto-pairs
		"nvim-mini/mini.pairs",
		opts = {},
		version = false,
	},
	{
		-- Plugin for better quickfix window
		"kevinhwang91/nvim-bqf",
		opts = {
			func_map = {
				vsplit = "<C-y>",
				hsplit = "<C-x>",
			},
		},
	},
	{ "petertriho/nvim-scrollbar", opts = {} },
	{
		-- Surround text objects plugin
		"kylechui/nvim-surround",
		version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
	},
	{
		-- Session management plugin
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {},
	},
	{
		-- Documentation generator plugin
		"danymat/neogen",
		opts = {
			snippet_engine = "nvim",
		},
		keys = {
			{
				"<leader>cd",
				function()
					require("neogen").generate()
				end,
				desc = "Generate documentation",
			},
		},
	},
	{
		-- Search and Replace plugin
		"MagicDuck/grug-far.nvim",
		config = true,
		keys = {
			{
				"<leader>/",
				function()
					---@type grug.far.OptionsOverride
					local opts = {}
					local entry = require("grug-far").get_last_history_entry()
					if entry ~= nil then
						opts.prefills = entry
						opts.engine = entry.engine
						opts.replacementInterpreter = entry.replacementInterpreter
					end

					require("grug-far").open(opts)
				end,
				mode = "n",
				desc = "Search and Replace",
			},
			{
				"<leader>/",
				function()
					require("grug-far").open()
				end,
				mode = "v",
				desc = "Search and Replace",
			},
		},
	},
	{
		event = "VeryLazy",
		"folke/flash.nvim",
		opts = {
			modes = {
				search = {
					emabled = true,
				},
				char = {
					jump_labels = true,
				},
			},
		},
	},
}

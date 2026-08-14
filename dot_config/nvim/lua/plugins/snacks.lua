local function current_file_dir()
	local file = vim.api.nvim_buf_get_name(0)
	return file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd()
end

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				preset = {
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "o",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
						},
						{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
						{
							icon = "󰑐 ",
							key = "S",
							desc = "Select Session",
							action = function()
								require("persistence").select()
							end,
						},
						{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
					{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
					{ section = "startup" },
				},
			},
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			-- notifier = { enabled = true, timeout = 3000 },
			picker = {
				enabled = true,
				win = {
					input = {
						keys = {
							["<C-x>"] = { "edit_split", mode = { "i", "n" } },
							["<C-s>"] = { "edit_vsplit", mode = { "i", "n" } },
						},
					},
					list = {
						keys = {
							["<C-x>"] = "edit_split",
							["<C-s>"] = "edit_vsplit",
						},
					},
				},
			},
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			lazygit = { enabled = false },
			-- words = { enabled = true },
		},
		keys = {
			{
				"<space><space>",
				function()
					Snacks.picker()
				end,
				desc = "Pickers",
			},
			{
				"<space>f",
				function()
					Snacks.picker.files()
				end,
				desc = "Find files",
			},
			{
				"<space>F",
				function()
					Snacks.picker.files({ cwd = current_file_dir() })
				end,
				desc = "Find files in current file directory",
			},
			{
				"<space>h",
				function()
					Snacks.picker.files({ cwd = vim.fn.expand("~"), hidden = false })
				end,
				desc = "Find files in $HOME",
			},
			{
				"<space>o",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent files",
			},
			{
				"<space>g",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Git files",
			},
			{
				"<space>s",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live grep",
			},
			{
				"<space>b",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<space>?",
				function()
					Snacks.picker.help()
				end,
				desc = "Help tags",
			},
			{
				"<space>k",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<space>c",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<space>2",
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<space>t",
				function()
					Snacks.picker.explorer({ cwd = vim.fn.getcwd(), hidden = true })
				end,
				desc = "File browser",
			},
			{
				"<space>T",
				function()
					Snacks.picker.explorer({ cwd = current_file_dir(), hidden = true })
				end,
				desc = "File browser in current file directory",
			},
			{
				"<space>m",
				function()
					Snacks.picker.man()
				end,
				desc = "Man pages",
			},
			{
				"<space>r",
				function()
					Snacks.picker.lsp_references()
				end,
				desc = "LSP references",
			},
			{
				"<leader>d",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "LSP definitions",
			},
			{
				"<leader>s",
				function()
					Snacks.picker.spelling()
				end,
				desc = "Spell suggest",
			},
		},
	},
}

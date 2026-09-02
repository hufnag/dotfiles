return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"jay-babu/mason-nvim-dap.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{
				"<leader>bc",
				function()
					require("dap").continue()
				end,
				desc = "Debug: Start/continue",
			},
			{
				"<leader>bb",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Debug: Toggle breakpoint",
			},
			{
				"<leader>bi",
				function()
					require("dap").step_into()
				end,
				desc = "Debug: Step into",
			},
			{
				"<leader>bO",
				function()
					require("dap").step_over()
				end,
				desc = "Debug: Step over",
			},
			{
				"<leader>bo",
				function()
					require("dap").step_out()
				end,
				desc = "Debug: Step out",
			},
			{
				"<leader>bu",
				function()
					require("dapui").toggle()
				end,
				desc = "Debug: Toggle UI",
			},
			{
				"<leader>bx",
				function()
					require("dap").terminate()
				end,
				desc = "Debug: Terminate",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			vim.fn.sign_define("DapBreakpoint", {
				text = "⬤",
				texthl = "DiagnosticError",
			})

			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb" },
				automatic_installation = true,
				handlers = {},
			})

			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			dap.listeners.before.attach.dapui = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui = function()
				dapui.close()
			end
		end,
	},
}

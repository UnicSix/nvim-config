return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	config = function ()
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
		local dap, dapui = require("dap"), require("dapui")

		require("dapui").setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			layouts = {
				{
					elements = {
						"scopes",
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40,
					position = "right",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 10,
					position = "bottom",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "single", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			controls = {
				enabled = false,
				elements = { "repl" },
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
			windows = { indent = 1 },
		})
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- keymaps
		vim.keymap.set('n', '<leader>xb', function () require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
		vim.keymap.set('n', '<leader>xB', function () require("dap").clear_breakpoints() end, { desc = "Clear Breakpoint" })
		vim.keymap.set('n', '<leader>xc', function () require("dap").continue() end, { desc = "continue" })
		vim.keymap.set('n', 'F5',         function () require("dap").continue() end, { desc = "continue" })
		vim.keymap.set('n', '<leader>xi', function () require("dap").step_into() end, { desc = "Step Into" })
		vim.keymap.set('n', 'F3',         function () require("dap").step_into() end, { desc = "Step Into" })
		vim.keymap.set('n', '<leader>xl', function () require("dapui").float_element "breakpoints" end, { desc = "List Breakpoints" })
		vim.keymap.set('n', '<leader>xo', function () require("dap").step_over()  end, { desc = "Step Over" })
		vim.keymap.set('n', '<leader>xO', function () require("dap").step_over()  end, { desc = "Step Out" })
		vim.keymap.set('n', '<leader>xq', function () require("dap").close() dapui.close() end, { desc = "Close Session" })

		vim.keymap.set('n', '<leader>xQ', function ()
			dap = require("dap")
			dap.terminate()
			dap.close()
			dapui.close()
		end, { desc = "Terminate" })
		vim.keymap.set('n', 'F6', function ()
			dap = require("dap")
			dap.terminate()
			dap.close()
			dapui.close()
		end, { desc = "Terminate" })

		vim.keymap.set('n', '<leader>xr', function() require("dap").repl.toggle() end, { desc = "REPL" })
		vim.keymap.set('n', '<leader>xs', function() require("dapui").float_element "scopes" end, { desc = "Scopes" })
		vim.keymap.set('n', '<leader>xt', function() require("dapui").float_element "stacks" end, { desc = "Threads" })
		vim.keymap.set('n', '<leader>xu', function() require("dapui").toggle() end, { desc = "Toggle Debugger UI" })
		vim.keymap.set('n', '<leader>xw', function() require("dapui").float_element "watches"end, { desc = "Watches" })
		vim.keymap.set('n', '<leader>xx', function() require("dap.ui.widgets").hover() end, { desc = "Inspect" })

	end
}

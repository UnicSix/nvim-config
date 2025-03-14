return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"nvim-neotest/nvim-nio",
	},
	init = function ()
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
	end,
	config = function()
		local dap = require("dap")
		dap.adapters.ansible = {
			type = "executable",
			command = "python",
			args = { "-m", "ansibug", "dap" },
		}
		local ansibug_configurations = {
			{
				type = "ansible",
				request = "launch",
				name = "Debug playbook",
				playbook = "${file}"
			},
		}
		dap.configurations["yaml.ansible"] = ansibug_configurations

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			-- args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
			args = { "-i", "dap"}
		}
		dap.adapters.codelldb = {
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function ()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function ()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
				end,
				pid = function ()
					local name = vim.fn.input("Executable name (filter): ")
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = "${workspaceFolder}",
			},
			-- {
			-- 	name = "Attach to gdbserver :1234",
			-- 	type = "gdb",
			-- 	request = "attach",
			-- 	target = "localhost:1234",
			-- 	program = function ()
			-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
			-- 	end,
			-- 	cwd = "${workspaceFolder}"
			-- },
		}
		dap.configurations.c = dap.configurations.cpp
		-- require 'code-dap-local'

		vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
      	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
      	vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
      	vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
      	vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DiagnosticInfo" })
	end,
}
--     

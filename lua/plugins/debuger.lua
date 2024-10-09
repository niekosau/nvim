return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap-python" },
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		require("dap-python").setup("/opt/homebrew/bin/python3.9")
		dapui.setup()
		dap.adapters.ansible = {
			type = "executable",
			command = "/opt/homebrew/opt/python@3.11/bin/python3.11",
			args = { "-m", "ansibug", "dap" },
		}
		local ansibug_configurations = {
			{
				type = "ansible",
				request = "launch",
				name = "Debug playbook",
				playbook = "${file}",
			},
		}
		dap.configurations["yaml.ansible"] = ansibug_configurations
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<Leader>B", dap.set_breakpoint, {})
	end,
}

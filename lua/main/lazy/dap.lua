return {
	"mfussenegger/nvim-dap",
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'williamboman/mason.nvim',
		'jay-babu/mason-nvim-dap.nvim',
		-- Add your own debuggers here
		'leoluz/nvim-dap-go',
	},
	config = function()
		local dap = require 'dap'
		local dapui = require 'dapui'

		require('mason-nvim-dap').setup {
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_setup = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				'debugpy',
				'delve',
				'java-debug-adapter',
			},
		}


		local function get_args()
			local args = {}
			local i = 1
			while true do
				local name, value = debug.getlocal(2, i)
				if not name then break end
				args[name] = value
				i = i + 1
			end
			return args
		end

		vim.keymap.set('n', '<leader>bB', function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Breakpoint Condition' })
		vim.keymap.set('n', '<leader>bb', function() require("dap").toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
		vim.keymap.set('n', '<leader>bc', function() require("dap").continue() end, { desc = 'Debug: Run/Continue' })
		vim.keymap.set('n', '<leader>ba', function() require("dap").continue({ before = get_args }) end, { desc = 'Debug: Run with Args' })
		vim.keymap.set('n', '<leader>bC', function() require("dap").run_to_cursor() end, { desc = 'Debug: Run to Cursor' })
		vim.keymap.set('n', '<leader>bg', function() require("dap").goto_() end, { desc = 'Debug: Go to Line (No Execute)' })
		vim.keymap.set('n', '<leader>bj', function() require("dap").down() end, { desc = 'Debug: Down' })
		vim.keymap.set('n', '<leader>bk', function() require("dap").up() end, { desc = 'Debug: Up' })
		vim.keymap.set('n', '<leader>bl', function() require("dap").run_last() end, { desc = 'Debug: Run Last' })
		vim.keymap.set('n', '<leader>bi', function() require("dap").step_into() end, { desc = 'Debug: Step Into' })
		vim.keymap.set('n', '<leader>bo', function() require("dap").step_out() end, { desc = 'Debug: Step Out' })
		vim.keymap.set('n', '<leader>bO', function() require("dap").step_over() end, { desc = 'Debug: Step Over' })
		vim.keymap.set('n', '<leader>bP', function() require("dap").pause() end, { desc = 'Debug: Pause' })
		vim.keymap.set('n', '<leader>br', function() require("dap").repl.toggle() end, { desc = 'Debug: Toggle REPL' })
		vim.keymap.set('n', '<leader>bs', function() require("dap").session() end, { desc = 'Debug: Session' })
		vim.keymap.set('n', '<leader>bt', function() require("dap").terminate() end, { desc = 'Debug: Terminate' })
		vim.keymap.set('n', '<leader>bw', function() require("dap.ui.widgets").hover() end, { desc = 'Debug: Widgets' })

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup {
			icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
			controls = {
				icons = {
					pause = '⏸',
					play = '▶',
					step_into = '⏎',
					step_over = '⏭',
					step_out = '⏮',
					step_back = 'b',
					run_last = '▶▶',
					terminate = '⏹',
					disconnect = '⏏',
				},
			},
		}

		vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

		dap.listeners.after.event_initialized['dapui_config'] = dapui.open
		dap.listeners.before.event_terminated['dapui_config'] = dapui.close
		dap.listeners.before.event_exited['dapui_config'] = dapui.close

		-- Install golang specific config
		require('dap-go').setup()
	end,
}

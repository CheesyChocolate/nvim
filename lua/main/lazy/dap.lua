return {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		config = function()
			local dap = require("dap")
			dap.set_log_level("INFO")

			-- TODO: do i need this?
			-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/09220b99d63d5363f219daa2785242ee5fddba7f/lua/mason-nvim-dap/mappings/configurations.lua#L6
			dap.configurations.go = {
				{
					type = "delve",
					name = "file",
					request = "launch",
					program = "${file}",
					outputMode = "remote",
				}
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

			vim.keymap.set('n', '<leader>dB', function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = 'Debug: Breakpoint Condition' })
			vim.keymap.set('n', '<leader>db', function() require("dap").toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
			vim.keymap.set('n', '<leader>dc', function() require("dap").continue() end, { desc = 'Debug: Run/Continue' })
			vim.keymap.set('n', '<leader>da', function() require("dap").continue({ before = get_args }) end, { desc = 'Debug: Run with Args' })
			vim.keymap.set('n', '<leader>dC', function() require("dap").run_to_cursor() end, { desc = 'Debug: Run to Cursor' })
			vim.keymap.set('n', '<leader>dg', function() require("dap").goto_() end, { desc = 'Debug: Go to Line (No Execute)' })
			vim.keymap.set('n', '<leader>dj', function() require("dap").down() end, { desc = 'Debug: Down' })
			vim.keymap.set('n', '<leader>dk', function() require("dap").up() end, { desc = 'Debug: Up' })
			vim.keymap.set('n', '<leader>dl', function() require("dap").run_last() end, { desc = 'Debug: Run Last' })
			vim.keymap.set('n', '<leader>di', function() require("dap").step_into() end, { desc = 'Debug: Step Into' })
			vim.keymap.set('n', '<leader>do', function() require("dap").step_out() end, { desc = 'Debug: Step Out' })
			vim.keymap.set('n', '<leader>dO', function() require("dap").step_over() end, { desc = 'Debug: Step Over' })
			vim.keymap.set('n', '<leader>dP', function() require("dap").pause() end, { desc = 'Debug: Pause' })
			vim.keymap.set('n', '<leader>dr', function() require("dap").repl.toggle() end, { desc = 'Debug: Toggle REPL' })
			vim.keymap.set('n', '<leader>ds', function() require("dap").session() end, { desc = 'Debug: Session' })
			vim.keymap.set('n', '<leader>dt', function() require("dap").terminate() end, { desc = 'Debug: Terminate' })
			vim.keymap.set('n', '<leader>dw', function() require("dap.ui.widgets").hover() end, { desc = 'Debug: Widgets' })
		end
	},


	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local function layout(name)
				return {
					elements = {
						{ id = name },
					},
					size = 40,
					position = "right",
				}
			end
			local name_to_layout = {
				repl = { layout = layout("repl"), index = 0 },
				stacks = { layout = layout("stacks"), index = 0 },
				scopes = { layout = layout("scopes"), index = 0 },
				console = { layout = layout("console"), index = 0 },
				watches = { layout = layout("watches"), index = 0 },
				breakpoints = { layout = layout("breakpoints"), index = 0 },
			}
			local layouts = {}

			for name, config in pairs(name_to_layout) do
				table.insert(layouts, config.layout)
				name_to_layout[name].index = #layouts
			end

			local function toggle_debug_ui(name)
				dapui.close()
				local layout_config = name_to_layout[name]

				if layout_config == nil then
					error(string.format("bad name: %s", name))
				end

				dapui.toggle(layout_config.index)
			end

			vim.keymap.set('n', '<leader>dui', dapui.toggle, { desc = 'Debug: See last session result.' }) -- TODO: do i need this?

			vim.keymap.set("n", "<leader>dur", function() toggle_debug_ui("repl") end, { desc = "Debug: toggle repl ui" })
			vim.keymap.set("n", "<leader>dus", function() toggle_debug_ui("stacks") end, { desc = "Debug: toggle stacks ui" })
			vim.keymap.set("n", "<leader>duw", function() toggle_debug_ui("watches") end, { desc = "Debug: toggle watches ui" })
			vim.keymap.set("n", "<leader>dub", function() toggle_debug_ui("breakpoints") end, { desc = "Debug: toggle breakpoints ui" })
			vim.keymap.set("n", "<leader>duS", function() toggle_debug_ui("scopes") end, { desc = "Debug: toggle scopes ui" })
			vim.keymap.set("n", "<leader>duc", function() toggle_debug_ui("console") end, { desc = "Debug: toggle console ui" })



			dapui.setup({ layouts = layouts })

			-- dap.listeners.after.event_initialized['dapui_config'] = dapui.open	-- TODO: do i need this?

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dap.listeners.after.event_output.dapui_config = function(_, body)
				if body.category == "console" then
					dapui.eval(body.output) -- Sends stdout/stderr to Console
				end
			end
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		config = function()
			require('mason-nvim-dap').setup {
				automatic_setup = true,
				ensure_installed = {
					'debugpy',
					'delve',
					'java-debug-adapter',
				},
				automatic_installation = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			}
		end,
	},
}

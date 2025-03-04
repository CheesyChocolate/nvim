return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"fredrikaverpil/neotest-golang",
		"leoluz/nvim-dap-go",
		"nvim-neotest/neotest-python",
		"rcasia/neotest-java",
		"alfaix/neotest-gtest",
		"rcasia/neotest-bash",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-golang")({
					dap = { justMyCode = false },
				}),
				require("neotest-python"),
				require("neotest-java"),
				require("neotest-gtest").setup({}),
				require("neotest-bash"),
			}
		})

		vim.keymap.set("n", "<leader>tr", function()
			require("neotest").run.run({
				suite = false,
				testify = true,
			})
		end, { desc = "Debug: Running Nearest Test" })

		vim.keymap.set("n", "<leader>tv", function()
			require("neotest").summary.toggle()
		end, { desc = "Debug: Summary Toggle" })

		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").run.run({
				suite = true,
				testify = true,
			})
		end, { desc = "Debug: Running Test Suite" })

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run the current test file" })

		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({
				suite = false,
				testify = true,
				strategy = "dap",
			})
		end, { desc = "Debug: Debug Nearest Test" })

		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open()
		end, { desc = "Debug: Open test output" })

		vim.keymap.set("n", "<leader>ta", function()
			require("neotest").run.run(vim.fn.getcwd())
		end, { desc = "Debug: Open test output" })

	end,
}

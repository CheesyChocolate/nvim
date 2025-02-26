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

		vim.keymap.set("n", "<leader>tc", function()
			neotest.run.run()
		end, { desc = "Run the nearest test" })

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Run the current test file" })
	end,
}

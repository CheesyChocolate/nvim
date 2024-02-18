return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
			"nvim-neotest/neotest-python",
			"marilari88/neotest-vitest",
			"Issafalcon/neotest-dotnet",
			"rcasia/neotest-java",
			"alfaix/neotest-gtest",
			"rcasia/neotest-bash",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-go"),
					require("neotest-python"),
					require("neotest-vitest"),
					require("neotest-dotnet"),
					require("neotest-java"),
					require("neotest-gtest").setup({}),
					require("neotest-bash"),
				}
			})

			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end)

			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end)
		end,
	},
}

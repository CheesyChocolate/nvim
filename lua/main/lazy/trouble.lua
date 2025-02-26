return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({})

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle("diagnostics")
			end, { desc = "Toggle Diagnostics Window" })

			vim.keymap.set("n", "<leader>to", function()
				require("trouble").toggle("todo")
			end, { desc = "Toggle todo list" })

			vim.keymap.set("n", "]t", function()
				require("trouble").next({ skip_groups = true, jump = true });
			end, { desc = "Next Trouble" })

			vim.keymap.set("n", "[t", function()
				require("trouble").previous({ skip_groups = true, jump = true });
			end, { desc = "Previous Trouble" })
		end
	},
}

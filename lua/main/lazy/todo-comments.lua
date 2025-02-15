return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup()

		vim.keymap.set("n", "<leader>td", function()
			require("trouble").toggle("todo")
		end, { desc = "Toggle todo list" })
	end,
}

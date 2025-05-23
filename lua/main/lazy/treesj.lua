return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter"
	},
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})

		vim.keymap.set('n', '<leader>m', require('treesj').toggle,
			{ desc = "splitting/joining blocks of code" })
	end
}

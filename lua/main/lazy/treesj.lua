return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter"
	},
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})

		local builtin = require('treesj')
		vim.keymap.set('n', '<leader>m', builtin.toggle)
	end
}

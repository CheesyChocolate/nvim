return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files,
			{ desc = "Lists files in current directory, respects .gitignore" })
		vim.keymap.set('n', '<leader>fg', builtin.git_files,
			{ desc = "Lists files in current git repository, respects .gitignore" })
		vim.keymap.set('n', '<leader>pws', function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Grep word under cursor in current directory" })
		vim.keymap.set('n', '<leader>fd', function()
			builtin.find_files({ no_ignore = true })
		end, { desc = "Find files in current directory, no respect to .gitignore" })
		vim.keymap.set('n', '<leader>pWs', function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Grep WORD under cursor in current directory" })
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Grep user input in current directory" })
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Lists help tags" })
	end
}

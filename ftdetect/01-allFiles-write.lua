-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position

vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		callback = function()
			local currPos = vim.fn.getpos(".")

			vim.cmd([[%s/\s\+$//e]])
			vim.cmd([[%s/\n\+\%$//e]])

			vim.fn.cursor(currPos[2], currPos[3])
		end
	}
)

-- TODO: https://www.reddit.com/r/neovim/comments/uvemjr/is_there_an_autocmd_pattern_to_exclude_a_specific/
-- for ipython files, don't save cursor position

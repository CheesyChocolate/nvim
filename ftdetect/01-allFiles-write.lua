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

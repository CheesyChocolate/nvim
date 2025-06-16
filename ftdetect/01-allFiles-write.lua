-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position

vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		callback = function()
			local currPos = vim.api.nvim_win_get_cursor(0)

			-- Disable for pass files
			if vim.fn.expand("%:p"):match("^/dev/shm/pass") then
				return
			end

			vim.cmd([[%s/\s\+$//e]])
			vim.cmd([[%s/\n\+\%$//e]])

			vim.api.nvim_win_set_cursor(0, currPos)
		end
	}
)

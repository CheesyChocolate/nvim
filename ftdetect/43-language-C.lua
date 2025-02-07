-- add trailing newline for ANSI C standard
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = { "*.c", "*.h" },
		callback = function()
			vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
		end
	}
)

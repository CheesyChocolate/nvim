-- add trailing newline for ANSI C standard
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*.[ch]",
		command = [["%s/\%$/\r/e]]
	}
)

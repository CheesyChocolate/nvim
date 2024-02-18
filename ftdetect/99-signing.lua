-- dash-dash-space signature delimiter in emails
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*neomutt*",
		command = [[%s/^--$/-- /e]]
	}
)

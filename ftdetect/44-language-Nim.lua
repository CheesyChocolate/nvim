-- TODO: does not work
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*.nim",
		command = [["%s/\t/        /g"]]
	}
)

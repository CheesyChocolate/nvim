-- When shortcut files are updated, renew bash and zsh and etc configs with new material
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "bm-files,bm-dirs",
		command = "!shortcuts"
	}
)

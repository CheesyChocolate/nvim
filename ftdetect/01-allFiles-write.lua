-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = "let currPos = getpos('.')"
	}
)

-- delete trailing whitespace
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = [[%s/\s\+$//e]]
	}
)

-- delete trailing newlines
vim.api.nvim_create_autocmd(
	"BufWritePre", {
		pattern = "*",
		command = [[%s/\n\+\%$//e]]
	}
)

vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "*",
		command = "cal cursor(currPos[1], currPos[2])"
	}
)

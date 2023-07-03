-- keymap to toggle goyo mode
-- TODO: ColorMyPencils()
-- TODO: set bg=light
-- TODO: set line linebreak<CR>
-- TODO: make a function then map it to a key
vim.keymap.set("n", "<leader>g", ":Goyo<CR>", { silent = true })

-- Enable Goyo by default for mutt writing
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/neomutt*"},
		command = "let g:goyo_width=80"
	}
)
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/neomutt*"},
		command = "set bg=light"
	}
)
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/neomutt*"},
		command = "map ZZ :Goyo|x!<CR>"
	}
)
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/neomutt*"},
		command = "map ZQ :Goyo|q!<CR>"
	}
)

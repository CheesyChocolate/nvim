---------------------read filetypes---------------------

vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/calcurse*", "~/.calcurse/notes/*"},
		callback = function() vim.opt.filetype = "markdown" end
	}
)

vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"*.ms", "*.me", "*.mom", "*.man"},
		callback = function() vim.opt.filetype = "groff" end
	}
)

vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"*.tex", "*.bib"},
		callback = function() vim.opt.filetype = "tex" end
	}
)

---------------------functions---------------------

-- Runs a script that cleans out tex build files whenever I close out of a .tex file.
vim.api.nvim_create_autocmd(
	"VimLeave", {
		pattern = "*.tex",
		command = "!texclear %"
	}
)

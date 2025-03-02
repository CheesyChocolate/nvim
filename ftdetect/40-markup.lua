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

---------------------functions---------------------

-- Runs a script that cleans out tex build files whenever I close out of a .tex file.
-- TODO: can't handle multiple .tex files open at once
vim.api.nvim_create_autocmd(
	"VimLeave", {
		pattern = "*.tex",
		command = "!latexmk -c %"
	}
)

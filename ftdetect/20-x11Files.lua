vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = "Xresources,Xdefaults,xresources,xdefaults",
		callback = function() vim.opt.filetype = "xdefaults" end
	}
)

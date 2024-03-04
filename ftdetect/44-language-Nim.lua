-- autocmd to set vim to use spaces instead of tabs
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = "*.nim",
		callback = function()
			vim.opt.expandtab = true
		end
	}
)

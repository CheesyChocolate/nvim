-- disable auto comment
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = "*",
		callback = function()
			vim.opt.formatoptions:remove { "c", "r", "o" }
		end
	}
)

--vim.api.nvim_create_autocmd("BufEnter", {
--	callback = function()
--		vim.opt.formatoptions:remove { "c", "r", "o" }
--	end,
--	group = vim.api.nvim_create_augroup("General Settings", { clear = true }),
--	desc = "Disable New Line Comment",
--})

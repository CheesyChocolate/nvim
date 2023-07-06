-- goyo settings
local goyoMode = true
local function setupGoyo()
	vim.cmd("Goyo")
	if goyoMode then
		vim.keymap.set("n", "ZZ", ":Goyo|x!<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "ZQ", ":Goyo|q!<CR>", { noremap = true, silent = true })
		vim.opt.bg = "dark"
		vim.opt.linebreak = true
		vim.g.goyo_width = 80
		goyoMode = false
	else
		vim.keymap.del("n", "ZZ")
		vim.keymap.del("n", "ZQ")
		vim.opt.linebreak = false
		goyoMode = true
	end
end

-- keymap to toggle goyo mode
vim.keymap.set("n", "<leader>g", function() setupGoyo() end, { silent = true })

-- set goyo options when opening neomutt temp files
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/neomutt*"},
		callback =  setupGoyo
	}
)

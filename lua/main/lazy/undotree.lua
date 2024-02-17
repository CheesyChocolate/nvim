return {
	"mbbill/undotree",

	config = function() 
		vim.opt.swapfile = false
		vim.opt.backup = false
		vim.opt.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
		vim.opt.undofile = true
		vim.g.undotree_WindowLayout = 4

		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end
}

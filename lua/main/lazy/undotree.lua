return {
	"mbbill/undotree",

	cmd = "UndotreeToggle",
	keys = { "<leader>u" },
	config = function()
		vim.g.undotree_WindowLayout = 4

		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree window" })
	end
}

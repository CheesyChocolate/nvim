return {
	"f-person/git-blame.nvim",
	cmd = { "GitBlameToggle", "GitBlameEnable" },
	config = function()
		require("gitblame").setup({
			enabled = false,
		})
	end,
}

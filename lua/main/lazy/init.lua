return {
	"nvim-lua/plenary.nvim",
	"jreybert/vimagit",
	"tpope/vim-surround",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
	"ap/vim-css-color",
}

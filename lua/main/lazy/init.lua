return {
	"nvim-lua/plenary.nvim",
	"jreybert/vimagit",
	"tpope/vim-surround",
	"tpope/vim-commentary", -- TODO: replace with "numToStr/Comment.nvim"
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end
	},
	"ap/vim-css-color",
}

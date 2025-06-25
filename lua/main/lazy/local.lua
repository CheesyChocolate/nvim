local local_plugins = {
	{
		"modeline.nvim",
		dir = "~/Templates/nvim/modeline.nvim",
		config = function()
			require("modeline").setup()
		end,
	},
}

return local_plugins

return {
	"m4xshen/hardtime.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("hardtime").setup({
			-- TODO: ideally enable always, except for magit buffers
			enabled = false,
			disable_mouse = false,
			restriction_mode = "hint",
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
		})
		-- disable hardtime if in magit buffer
		vim.api.nvim_create_autocmd(
			{ "BufEnter", "BufRead", "BufWinEnter", }, {
				pattern = "magit*",
				callback = function()
					require("hardtime").disable()
				end
			}
		)
	end
}

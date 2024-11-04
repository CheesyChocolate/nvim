-- TODO: fix magit buffer not showing suggestions
return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-_>",
					--TODO: Look for better keymap
					accept_line = "<C-v>",
				},
			},
			filetypes = {
				["*"] = true,
			},
		}
	end
}

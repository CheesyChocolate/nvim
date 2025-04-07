return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup {
			server = {
				type = "binary",
			},
			copilot_model = "gpt-4o-copilot",
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 25,
				keymap = {
					accept = "<C-_>",
					--TODO: Look for better keymap
					accept_line = "<C-v>",
					next = false,
					prev = false,
					dismiss = false,
				},
			},
			filetypes = {
				env = false,
				["*"] = true,
			},
			should_attach = function(_, _)
				return true
			end,
		}
	end
}

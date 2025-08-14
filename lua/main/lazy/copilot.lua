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
					accept_word = "<C-\\>",
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
	end,
	-- "supermaven-inc/supermaven-nvim",
	-- config = function()
	-- 	require("supermaven-nvim").setup({
	-- 		keymaps = {
	-- 			accept_suggestion = "<C-_>",
	-- 			clear_suggestion = nil,
	-- 			accept_word = "<C-\\>",
	-- 		},
	-- 		ignore_filetypes = {
	-- 			env = true,
	-- 		},
	-- 	})
	-- end,
}

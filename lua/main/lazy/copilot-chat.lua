return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
	},
	build = "make tiktoken",    -- Only on MacOS or Linux
	config = function()
		require("CopilotChat").setup({
		model = "claude-3.7-sonnet"
		})
	end,
}

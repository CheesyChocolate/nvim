return {
	"eandrju/cellular-automaton.nvim",
	config = function()
		vim.keymap.set("n", "<leader>ca",
			function() require("cellular-automaton").start_animation("make_it_rain") end,
			{ desc = 'Fun: Make it rain' })
	end
}

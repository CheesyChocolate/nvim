return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = {
				{
					file_pattern = {
						"env",
						"*.env",
						"*.env.*",
						"wrangler.toml",
						".dev.vars",
					},
					cloak_pattern = "=.+"
				},
				{
					file_pattern = {
						"/dev/shm/pass*",
					},
					cloak_pattern = ".+"
				},
				{
					file_pattern = {
						"*.conf",
					},
					cloak_pattern = {
						"token=.+",
						"TOKEN=.+",
						"key=.+",
						"KEY=.+",
						"password=.+",
						"PASSWORD=.+",
					},
				},
			},
		})
	end
}

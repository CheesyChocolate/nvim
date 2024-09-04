return {
	"GCBallesteros/jupytext.nvim",
	config = function()
		require("jupytext").setup({
			-- TODO: fix open files that lack metadata
			output_extension = "py",
			custom_language_formatting = {
				ipynb = {
					extension = "py",
					style = "hydrogen",
					force_ft = "python"
				}
			}
		})
	end
}

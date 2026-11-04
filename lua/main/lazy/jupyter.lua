return {
	"GCBallesteros/jupytext.nvim",
	ft = { "ipynb" },
	-- .ipynb is detected as json, so ft alone never fires; also match the filename
	event = { "BufReadCmd *.ipynb", "BufNewFile *.ipynb" },
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

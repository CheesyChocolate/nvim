-- Run xrdb whenever Xdefaults or Xresources are updated.
vim.api.nvim_create_autocmd(
	"BufWritePost", {
		pattern = "Xresources,Xdefaults,xresources,xdefaults",
		command = "!xrdb %"
	}
)

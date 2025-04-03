vim.filetype.add({
	pattern = {
		["env"] = "env",
		[".*%.env"] = "env",
		[".*%.env%..*"] = "env",
	}
})

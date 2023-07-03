-- keymap
vim.keymap.set("n", "<leader>v", ":VimwikiIndex<CR>", { silent = true })

-- ensure files are read as what I want:
vim.g.vimwiki_ext2syntax = {
	['.Rmd'] = 'markdown',
	['.rmd'] = 'markdown',
	['.md'] = 'markdown',
	['.markdown'] = 'markdown',
	['.mdown'] = 'markdown'
}

vim.g.vimwiki_list = {
    {
        path = '~/.local/share/nvim/vimwiki',
        syntax = 'markdown',
        ext = '.md'
    }
}

--TODO: fix
--https://github.com/vimwiki/vimwiki/issues/1319
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/calcurse*", "~/.calcurse/notes/*"},
		command = "set filetype=markdown"
	}
)

vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"*.ms", "*.me", "*.mom", "*.man"},
		command = "set filetype=groff"
	}
)

vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"*.tex", "*.bib"},
		command = "set filetype=tex"
	}
)

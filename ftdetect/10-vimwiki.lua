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

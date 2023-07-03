-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'


use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('mbbill/undotree')

use {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	requires = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{                                      -- Optional
		'williamboman/mason.nvim',
		run = function()
			pcall(vim.cmd, 'MasonUpdate')
		end,
	},
	{'williamboman/mason-lspconfig.nvim'}, -- Optional

	-- Autocompletion
	{'hrsh7th/nvim-cmp'},     -- Required
	{'hrsh7th/cmp-nvim-lsp'}, -- Required
	{'L3MON4D3/LuaSnip'},     -- Required

	-- cmp
	{'hrsh7th/cmp-path'},     		-- Optionald
	{'hrsh7th/cmp-nvim-lsp'},     		-- Optionald
	{'hrsh7th/cmp-buffer'},     		-- Optionald
	{'saadparwaiz1/cmp_luasnip'},     	-- Optionald
	{'rafamadriz/friendly-snippets'},     	-- Optionald
}
}

use("github/copilot.vim")
use("vim-airline/vim-airline") -- TODO: considering transition to 'nvim-lualine/lualine.nvim'
use("junegunn/goyo.vim") -- TODO: considering transition to 'Pocco81/true-zen.nvim'
use("vimwiki/vimwiki")
use("tpope/vim-surround")
use("jreybert/vimagit")
use("tpope/vim-commentary")
use("ap/vim-css-color")

end)

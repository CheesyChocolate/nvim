vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"}, {
		pattern = {"/tmp/neomutt*"},
		callback = function()
			-- TODO: does not retain the config defined in plugin
			-- temporary fix
			require("zen-mode").setup {
				window = {
					width = 80,
					options = {
						number = false,
						relativenumber = false,
						foldcolumn = "0",
					},
				},
				plugins = {
					options = {
						enabled = true,
						linebreak = true,
					},
				},
				on_open = function(win)
					vim.keymap.set("n", "ZZ", ":ZenMode|x!<CR>", { noremap = true, silent = true })
					vim.keymap.set("n", "ZQ", ":ZenMode|q!<CR>", { noremap = true, silent = true })
				end,
				on_close = function()
					vim.keymap.del("n", "ZZ")
					vim.keymap.del("n", "ZQ")
				end,
			}

			require("zen-mode").toggle()
			-- TODO: doesn't work
			-- switch to second window
			-- vim.cmd("wincmd w")
		end
	}
)

return {
	"folke/zen-mode.nvim",
	config = function()
		vim.keymap.set("n", "<leader>z", function()
			require("zen-mode").setup {
				window = {
					width = 80,
					options = {
						number = false,
						relativenumber = false,
						foldcolumn = "0",
					},
				},
				plugins = {
					options = {
						enabled = true,
						linebreak = true,
					},
				},
				-- TODO: alias :q to :ZenMode | q
				on_open = function(win)
					vim.keymap.set("n", "ZZ", ":ZenMode|x!<CR>", { noremap = true, silent = true })
					vim.keymap.set("n", "ZQ", ":ZenMode|q!<CR>", { noremap = true, silent = true })
				end,
				on_close = function()
					vim.keymap.del("n", "ZZ")
					vim.keymap.del("n", "ZQ")
				end,
			}

			require("zen-mode").toggle()
			ColorMyPencils()
		end)
	end
}

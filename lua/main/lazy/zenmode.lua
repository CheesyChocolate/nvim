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

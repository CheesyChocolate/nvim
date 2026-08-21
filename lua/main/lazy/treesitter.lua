return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- Install every available parser in the background.
		require("nvim-treesitter").install("all")

		local max_filesize = 100 * 1024 -- 100 KB
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
				if ok and stats and stats.size > max_filesize then
					vim.notify(
						"File larger than 100KB treesitter disabled for performance",
						vim.log.levels.WARN,
						{ title = "Treesitter" }
					)
					return
				end

				local started = pcall(vim.treesitter.start)
				if not started then
					return
				end

				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				if args.match == "markdown" then
					vim.bo[args.buf].syntax = "on"
				end
			end,
		})

		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
		})

		local select = require("nvim-treesitter-textobjects.select")
		vim.keymap.set({ "x", "o" }, "af", function()
			select.select_textobject("@function.outer", "textobjects")
		end, { desc = "Select outer function" })
		vim.keymap.set({ "x", "o" }, "if", function()
			select.select_textobject("@function.inner", "textobjects")
		end, { desc = "Select inner function" })

		require("treesitter-context").setup({
			enable = true,
		})
		vim.keymap.set("n", "<leader>tc", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end, { silent = true, desc = "Jump to context" })
	end,
}

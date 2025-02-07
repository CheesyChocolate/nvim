--TODO: absolute path files
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
			{ desc = 'Add current file to harpoon list' })
		vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = 'Toggle harpoons menu' })

		vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
			{ desc = 'Harpoon: switch to hook 1' })
		vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end,
			{ desc = 'Harpoon: switch to hook 2' })
		vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end,
			{ desc = 'Harpoon: switch to hook 3' })
		vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end,
			{ desc = 'Harpoon: switch to hook 4' })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end,
			{ desc = 'Harpoon: switch to previous hook' })
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,
			{ desc = 'Harpoon: switch to next hook' })
	end
}

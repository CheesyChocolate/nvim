return {
	-- BUG: Breaks on bufreadpost

	-- "https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
	-- config = function()
	-- 	require("sonarlint").setup({
	-- 		server = {
	-- 			cmd = {
	-- 				vim.fn.expand("$MASON/packages/sonarlint-language-server/sonarlint-language-server"),
	-- 				'-stdio',
	-- 				'-analyzers',
	-- 				-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
	-- 				-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
	-- 				-- vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
	-- 				vim.fn.expand("$MASON/share/sonarlint-analyzers/*.jar", true, 1),
	-- 			},
	-- 			-- autostart = true,
	-- 		},
	-- 		filetypes = {
	-- 			'python',
	-- 			'cpp',
	-- 			'java',
	-- 		},
	-- 	})
	-- end
}

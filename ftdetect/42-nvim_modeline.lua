local modeline_handlers = {
	LspStop = function(arg)
		-- Parse arguments: support ++force, comma/space separation, and "all"
		local force = false
		arg = arg or ""
		if arg:find("++force") then
			force = true
			arg = arg:gsub("++force", "")
		end
		arg = vim.trim(arg)
		if arg == "all" or arg == "" then
			for _, client in ipairs(vim.lsp.get_clients()) do
				client.stop(force)
			end
			return
		end

		-- Split by comma or space, trim patterns
		local names = {}
		for name in arg:gmatch("[^,%s]+") do
			table.insert(names, vim.trim(name))
		end

		-- Support pattern matching for names
		for _, client in ipairs(vim.lsp.get_clients()) do
			for _, name in ipairs(names) do
				if client.name:find(name, 1, true) then
					client.stop(force)
				end
			end
		end
	end,
}

local function parse_modelines(bufnr)
	local total_lines = vim.api.nvim_buf_line_count(bufnr)
	local lines = {}

	local function add_lines(start_line, end_line)
		local seg = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line, false)
		for _, l in ipairs(seg) do
			table.insert(lines, l)
		end
	end

	add_lines(0, math.min(5, total_lines))
	if total_lines > 5 then
		add_lines(total_lines - 5, total_lines)
	end

	local parsed = {}
	for _, line in ipairs(lines) do
		-- Match any command and arguments, allow ++force anywhere
		local cmd, arg = line:match("nvim:%s*(%w+)%s+([%w,%s%+%-%*]*)")
		if cmd and modeline_handlers[cmd] then
			table.insert(parsed, { cmd = cmd, arg = arg })
		end
	end

	return parsed
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local parsed = parse_modelines(bufnr)

		for _, item in ipairs(parsed) do
			vim.schedule(function()
				modeline_handlers[item.cmd](item.arg)
			end)
		end
	end,
})

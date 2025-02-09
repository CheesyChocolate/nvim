return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"folke/neodev.nvim",
		-- "j-hui/fidget.nvim",
	},

	config = function()
		require("neodev").setup()

		local cmp = require('cmp')
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		-- require("fidget").setup({})
		require("mason").setup({
			PATH = "append",
		})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"angularls",
				"arduino_language_server",
				"asm_lsp",
				"bashls",
				"biome",
				"clangd",
				"elixirls",
				"eslint",
				"gopls",
				"html",
				"htmx",
				"jdtls",
				"jedi_language_server",
				"jsonls",
				"kotlin_language_server",
				"lemminx",
				"ltex",
				"lua_ls",
				"marksman",
				"matlab_ls",
				"perlnavigator",
				"phpactor",
				"pylsp",
				"ruff",
				"rust_analyzer",
				"sqlls",
				"ts_ls",
				"typos_lsp",
				"yamlls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						capabilities = capabilities
					}
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								}
							}
						}
					}
				end,
			}
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'nvim-lsp-signature-help' },
				{ name = 'path' },
			}, {
				{ name = 'buffer' },
			})
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)

				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if client and client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
				end

				-- TODO: Does not work
				if client and client.server_capabilities.codeLensProvider then
					vim.lsp.codelens.refresh()
					vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
						buffer = ev.buf,
						callback = vim.lsp.codelens.refresh
						-- callback = function()
						-- 	vim.lsp.codelens.refresh({ bufnr = ev.buf })
						-- end
					})
				end

				local opts = { buffer = ev.buf }
				opts.desc = "Format buffer"
				vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
				opts.desc = "Go to Definition"
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				opts.desc = "Show hover information"
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				opts.desc = "View Workspace Symbols"
				vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
				opts.desc = "View diagnostics"
				vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
				opts.desc = "View Code Actions"
				vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
				opts.desc = "View RefeRences"
				vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
				opts.desc = "ReName symbol"
				vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
				opts.desc = "Show signature help"
				vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
				opts.desc = "Go to next diagnostic"
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
				opts.desc = "Go to previous diagnostic"
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
			end
		})
	end
}

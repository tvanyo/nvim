-- Original source https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		--"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		--local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			-- opts.desc = "Show LSP references"
			-- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
			--
			-- opts.desc = "Go to declaration"
			-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
			--
			-- opts.desc = "Show LSP definitions"
			-- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
			--
			-- opts.desc = "Show LSP implementations"
			-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
			--
			-- opts.desc = "Show LSP type definitions"
			-- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
			--
			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			-- opts.desc = "Show buffer diagnostics"
			-- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		--local capabilities = cmp_nvim_lsp.default_capabilities()
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.INFO] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "Error",
					[vim.diagnostic.severity.WARN] = "Warn",
					[vim.diagnostic.severity.INFO] = "Info",
					[vim.diagnostic.severity.HINT] = "Hint",
				},
			},
			jump = { float = true },
		})
		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "typescript", "javascript" },
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure clangd language server
		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "cpp", "c", "h", "hpp", "hh" },
		})
		--
		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		--
		-- configure shell language server
		lspconfig["bashls"].setup({
			cmd = { "bash-language-server", "start" },
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "sh", "zsh" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}

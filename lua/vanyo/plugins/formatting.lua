return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufReadPre", "BufNewFile" },

	-- source: https://github.com/fsouza/prettierd?tab=readme-ov-file
	use_prettierd = function()
		return {
			exe = "prettierd",
			args = { vim.api.nvim_buf_get_name(0) },
			stdin = true,
		}
	end,

	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				--javascriptreact = { "prettier" },
				--typescriptreact = { "prettier" },
				--svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				-- markdown = { "use_prettierd" },
				-- graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- Source: https://github.com/stevearc/conform.nvim/blob/master/doc/formatter_options.md#prettier
		--require("conform").formatters.prettierd = {
		require("conform").formatters.prettier = {
			options = {
				-- Use a specific prettier parser for a filetype
				-- Otherwise, prettier will try to infer the parser from the file name
				ft_parsers = {
					javascript = "babel",
					--     javascriptreact = "babel",
					typescript = "typescript",
					--     typescriptreact = "typescript",
					--     vue = "vue",
					css = "css",
					--     scss = "scss",
					--     less = "less",
					--     html = "html",
					json = "json",
					--     jsonc = "json",
					yaml = "yaml",
					markdown = "markdown",
					--     ["markdown.mdx"] = "mdx",
					--     graphql = "graphql",
					--     handlebars = "glimmer",
				},
				-- Use a specific prettier parser for a file extension
				ext_parsers = {
					-- qmd = "markdown",
				},
			},
		}

		-- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		-- 	conform.format({
		-- 		lsp_fallback = true,
		-- 		async = false,
		-- 		timeout_ms = 500,
		-- 	})
		-- end, { desc = "Format file or range (in visual mode) " })
	end,
}

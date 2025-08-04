return {
    "stevearc/conform.nvim",
    event = { "BufWritePre", "BufReadPre", "BufNewFile" },

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
                --markdown = { "prettier" },
                markdown = { "markdownlint" },
                -- graphql = { "prettier" },
                lua = { "stylua" },
                sh = { "shellharden", "shfmt" },
                zsh = { "shellharden", "shfmt" },
                python = { "isort", "black" },
            },
            formatters = {
                prettier = {
                    append_args = { "--tab-width", "4", "--trailing-comma", "es5" },
                },
                markdownlint = { args = { "MD007", "4" } },
                stylua = { prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" } },
            },
            format_on_save = {
                lsp_fallback = true,
                --async = false,
                timeout_ms = 2500,
            },
        })

        -- Source: https://github.com/stevearc/conform.nvim/blob/master/doc/formatter_options.md#prettier
        --require("conform").formatters.prettierd = {
        -- require("conform").formatters.prettier = {
        -- 	options = {
        -- 		-- Use a specific prettier parser for a filetype
        -- 		-- Otherwise, prettier will try to infer the parser from the file name
        -- 		ft_parsers = {
        -- 			javascript = "babel",
        -- 			--     javascriptreact = "babel",
        -- 			typescript = "typescript",
        -- 			--     typescriptreact = "typescript",
        -- 			--     vue = "vue",
        -- 			css = "css",
        -- 			--     scss = "scss",
        -- 			--     less = "less",
        -- 			--     html = "html",
        -- 			json = "json",
        -- 			--     jsonc = "json",
        -- 			yaml = "yaml",
        -- 			markdown = "markdown",
        -- 			--     ["markdown.mdx"] = "mdx",
        -- 			--     graphql = "graphql",
        -- 			--     handlebars = "glimmer",
        -- 		},
        -- 		-- Use a specific prettier parser for a file extension
        -- 		ext_parsers = {
        -- 			-- qmd = "markdown",
        -- 		},
        -- 	},
        -- }

        -- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        -- 	conform.format({
        -- 		lsp_fallback = true,
        -- 		async = false,
        -- 		timeout_ms = 500,
        -- 	})
        -- end, { desc = "Format file or range (in visual mode) " })
    end,
}

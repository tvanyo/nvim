return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            typescript = { "eslint_d" },
            shell = { "shellcheck" },
            python = { "ruff" },
            -- python = { "flake8" },
            -- markdown = { "markdownlint" },
            -- python = { "pylint" },
        }

        --- Ignore too many '#' and line length for flake8
        local flake8 = require("lint").linters.flake8
        flake8.args = { "--max-line-length", "88", "--ignore", "E266,E501" }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        -- vim.keymap.set("n", "<leader>l", function()
        -- 	lint.try_lint()
        -- end, { desc = "Trigger linting for current file" })
    end,
}

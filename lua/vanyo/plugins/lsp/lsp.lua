return {
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
    }),
    vim.lsp.config("pylsp", {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = { enabled = false },
                    mccabe = { enabled = false },
                    pyflakes = { enabled = false },
                    flake8 = {
                        enabled = true,
                        ignore = { "E501", "E266" },
                        maxLineLength = 100,
                    },
                },
            },
        },
    }),
}

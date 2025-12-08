return {
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "eslint",
                "ts_ls",
            },
        },
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opt = {
            ensure_installed = {
                "shfmt",
                "shellcheck",
                "prettier",
                "clangd",
                "stylua",
                "isort",
                "black",
                "pyright",
                "eslint_d",
            },
        },
        dependencies = { "williamboman/mason.nvim" },
    },
}

return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependenices = {
		{ "mason-org/mason.nvim", opt = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"pyright",
				"pylsp",
				"bashls",
				"lua_ls",
				"ts_ls",
				"clangd",
			},
		})
		vim.lsp.config("pyright", {
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
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim", "require" },
					},
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
			},
		})
	end,
}

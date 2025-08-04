return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependenices = {
		{ "mason-org/mason.nvim", opt = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
	end,
	-- config = function()
	-- 	vim.lsp.config("lua_ls", {
	-- 		settings = {
	-- 			Lua = {
	-- 				runtime = {
	-- 					version = "LuaJIT",
	-- 				},
	-- 				diagnostics = {
	-- 					globals = { "vim", "require" },
	-- 				},
	-- 				workspace = { library = vim.api.nvim.get_runtime_file("", true) },
	-- 				telemetry = { enable = false },
	-- 			},
	-- 		},
	-- 	})
	-- end,
}

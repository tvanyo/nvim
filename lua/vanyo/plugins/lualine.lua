return { -- Set lualine as statusline
	-- See `:help lualine.txt`
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"yavorski/lualine-macro-recording.nvim",
	},
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = "onedark",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = { "filename", "macro_recording", "%S" },
			},
		})
	end,
}

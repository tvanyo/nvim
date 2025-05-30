vim.g.blink_lspEnable = false

vim.keymap.set({ "n" }, "<leader>bl", function()
	local temp = vim.g.blink_lspEnable
	temp = not temp
	vim.g.blink_lspEnable = temp
end, { desc = "toggle lsp source for completion" })

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	-- dependencies = { "rafamadriz/friendly-snippets" },
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
	},
	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = "cargo build --release",
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "default" },

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
			-- This is the place put specific icon types so there is no dependency on other packages
			kind_icons = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		},

		completion = {
			-- (Default) Only show the documentation popup when manually triggered
			documentation = { auto_show = false },
			menu = {
				-- Don't automatically show the completion menu
				-- auto_show = false,

				-- nvim-cmp style menu
				draw = {
					columns = {
						{ "kind_icon", "label", "kind", gap = 2 },
						--			{ "label", "label_description", gap = 1 },
					},
				},
			},
		},
		snippets = { preset = "luasnip" },
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			-- "lsp": shows completions from the language server, will get a lot of completions
			-- "path": shows completions for path
			-- "snippets": shows completions for detected snippets
			-- "buffer": completions for the buffer
			-- default = { "path", "snippets", "buffer" },
			-- per_filetype = {
			-- 	python = { inherit_defaults = true, "lsp" },
			-- 	lua = { inherit_defaults = true, "lsp" },
			-- },
			providers = {
				snippets = { enabled = true },
				buffer = { enabled = true },
				path = { enabled = true },
				lsp = {
					enabled = function()
						return vim.g.blink_lspEnable
					end,
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	-- opts_extend = { "sources.default" },
	opts_extend = {},
}

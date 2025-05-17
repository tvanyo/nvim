return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	-- build = "make install_jsregexp",
	--	require("luasnip.loaders.from_lua").lazy_load({ paths = "$HOME/.config/nvim/vanyo.snippets/" }),
	config = function()
		local ls = require("luasnip")
		ls.setup({
			update_events = { "TextChanged", "TextChangedI" },
			exit_roots = false,
			keep_roots = true,
			link_roots = true,
			link_children = false,
			delete_check_events = "TextChanged",
			enable_autosnippets = true,
		})

		-- keymaps
		vim.keymap.set({ "i" }, "<C-K>", function()
			ls.expand()
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			ls.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			ls.jump(-1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, { silent = true })

		-- Snippet Creator
		-- s(<trigger>, <nodes>)
		local s = ls.s

		-- Format node
		-- Takes a format string and set of nodes
		-- fmt(<fmt_strng>, {…nodes})
		local fmt = require("luasnip.extras.fmt").fmt
		local fmta = require("luasnip.extras.fmt").fmta

		-- Insert node
		-- Takes a position. like $1, & optioally some default text
		-- i(<position>,[default_text])
		local i = ls.insert_node

		-- text node
		local t = ls.text_node

		-- Repeat node
		-- rep(<position>)
		local rep = require("luasnip.extras").rep

		-- Thanks, Winblows, for making me have to point to a different directory
		if vim.uv.os_uname().sysname ~= "Windows_NT" then
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/vanyo/snippets/" })
		else
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/Local Settings/nvim/lua/vanyo/snippets" })
		end
		-- require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/vanyo/snippets/" })
		-- 	ls.add_snippets("lua", {
		-- 		s(
		-- 			"req",
		-- 			fmt(
		-- 				"local {} = require('{}')\nlocal {} = {}.{}",
		-- 				{ i(1, "default"), i(2, "foobar"), i(3, "barfoo"), rep(1), i(4, "default") }
		-- 			)
		-- 		),
		-- 	})
	end,
}

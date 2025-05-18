local keymap = vim.keymap
--
-- Window movement
keymap.set("n", "<C-j>", "<C-W>j", { noremap = true, desc = "Move to lower panel" })
keymap.set("n", "<C-k>", "<C-W>k", { noremap = true, desc = "Move to upper panel" })
keymap.set("n", "<C-l>", "<C-W>l", { noremap = true, desc = "Move to right panel" })
keymap.set("n", "<C-h>", "<C-W>h", { noremap = true, desc = "Move to left panel" })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Closing buffers with ease
keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })
keymap.set("n", "<leader>w", "<cmd>bp|bd #<CR>", { desc = "Close Buffer; Retain Split" })

-- Yanking that makes sense to me
keymap.set("n", "Y", "yy", { noremap = true, desc = "yank entire line" })
keymap.set("n", "yy", "y$", { noremap = true, desc = "yank to end of line" })
--
-- Pasting from clipboard that makes sense to me
keymap.set("n", "cp", ":put+<cr>", { noremap = true, desc = "paste from clipboard before line" })
keymap.set("n", "cP", ":put!+<cr>", { noremap = true, desc = "paste from clipboard after line" })

-- accessing marks
keymap.set("n", "`", "'", { noremap = true })
keymap.set("n", "'", "`", { noremap = true })

-- vertical movement
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- NvimTree
keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>", { noremap = true })

-- Just save damn it
-- vim.keymap.set("i", ":w", "<esc>:w<CR>", { noremap = true })

-- search stuff
keymap.set("n", "<leader>;", ":noh<CR>", { noremap = true, desc = "turn off highlighting" })

-- Return to previous link in markdown notes
keymap.set("n", "<bs>", ":edit #<cr>", { silent = true })
-- open url
keymap.set(
	"n",
	"gx",
	[[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]],
	{ noremap = true, desc = "follow link" }
)

-- noice keymaps
-- keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss noice messages" })
-- keymap.set("n", "<leader>nt", "<cmd>Telescope noice<CR>", { desc = "Telescope messages" })

-- telescope keymaps (see ../plugins/telescope.lua)
-- local builtin = require("telescope.builtin")
-- keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
-- keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "find with rg" })
-- keymap.set("n", "<leader>fb", builtin.buffers, { desc = "find buffers" })
-- keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help tags" })

-- linting keymaps (see ../plugins/linting.lua)
vim.keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

-- formatting keymaps (see ../plugins/formatting.lua)
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode) " })

-- lsp keymaps (see ../plugins/lsp/lspconfig.lua)
-- These keymaps are still in ../plugins/lsp/lspconfig.lua becaues of the on_attach functionality
-- Duplicated here just for easy access if necessary
-- 	opts.buffer = bufnr
-- 	-- set keybinds
-- 	opts.desc = "Show LSP references"
-- 	keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
-- 	opts.desc = "Go to declaration"
-- 	keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
-- 	opts.desc = "Show LSP definitions"
-- 	keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
-- 	opts.desc = "Show LSP implementations"
-- 	keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
-- 	opts.desc = "Show LSP type definitions"
-- 	keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
-- 	opts.desc = "See available code actions"
-- 	keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
-- 	opts.desc = "Smart rename"
-- 	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
-- 	opts.desc = "Show buffer diagnostics"
-- 	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
-- 	opts.desc = "Show line diagnostics"
-- 	keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
-- 	opts.desc = "Go to previous diagnostic"
-- 	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
-- 	opts.desc = "Go to next diagnostic"
-- 	keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
-- 	opts.desc = "Show documentation for what is under cursor"
-- 	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
-- 	opts.desc = "Restart LSP"
-- 	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
-- end

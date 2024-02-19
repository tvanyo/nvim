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


-- Window movement
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", {noremap = true, desc="Move to lower panel" })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", {noremap = true, desc="Move to upper panel" })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", {noremap = true, desc="Move to right panel" })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", {noremap = true, desc="Move to left panel" })

-- Yanking that makes sense to me
vim.keymap.set("n", "Y", "yy", {noremap=true, desc="yank entire line"})
vim.keymap.set("n", "yy", "y$", {noremap=true, desc="yank to end of line"})

-- accessing marks
vim.keymap.set("n", "`","'", {noremap=true})
vim.keymap.set("n", "'", "`", {noremap=true})

-- vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true})
vim.keymap.set("i", ";t", "<esc>gg", {noremap = true})
vim.keymap.set("i", ";b", "<esc>G", {noremap = true})
vim.keymap.set("n", "<leader>t", "<esc>gg", {noremap = true})
vim.keymap.set("n", "<leader>b", "<esc>G", {noremap = true})

-- Just save damn it
vim.keymap.set("i", ":w", "<esc>:w<CR>", {noremap=true})

-- search stuff
vim.keymap.set("n", "<leader>/", ":noh<CR>", {noremap = true, desc = "turn off highlighting"})

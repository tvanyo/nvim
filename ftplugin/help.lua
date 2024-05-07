-- Modified to lua from info @ https://vim.fandom.com/wiki/Learn_to_use_help
local bufopts = { noremap = true, silent = true, buffer = vim.fn.bufnr() }
vim.keymap.set("n", "<CR>", "<C-]>", bufopts)
vim.keymap.set("n", "<BS>", "<C-T>", bufopts)
-- Not sure how these help
-- vim.keymap.set("n", "o", "/'l{2,}'<CR>", bufopts)
-- vim.keymap.set("n", "O", "?'l{2,}'<CR>", bufopts)
-- vim.keymap.set("n", "s", "/|\zsS+\ze|<CR>", bufopts)
-- vim.keymap.set("n", "S", "?|\zsS+\ze|<CR>", bufopts)

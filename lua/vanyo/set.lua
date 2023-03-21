-- Syntax related
vim.opt.syntax="on"
vim.opt.autoindent = true

-- Spacing
vim.opt.expandtab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

-- Getting line numbers the way I like
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.cursorline=true
vim.opt.cursorlineopt="number"
vim.cmd "highlight clear CursorLine"
vim.o.termguicolors=true
vim.cmd "highlight LineNr gui=NONE guifg=orange"
vim.cmd "highlight CursorLineNr guibg=orange guifg=black"
--vim.cmd "highlight LineNr cterm=NONE ctermfg=172"
--vim.cmd "highlight CursorLineNr ctermbg=172 ctermfg=255"

-- Search
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.o.ignorecase = true
vim.o.smartcase = true

-- other stuff
vim.opt.encoding = "utf-8"
vim.o.mouse = "a"
vim.o.clipboard="unnamedplus"

-- undo
vim.o.undofile=true

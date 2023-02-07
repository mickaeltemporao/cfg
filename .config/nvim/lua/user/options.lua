-- interface
vim.opt.colorcolumn = '80' -- highlight over length lines
vim.opt.cursorline = true -- highlight current line
vim.opt.number = true -- line numbers
vim.opt.termguicolors = true -- enable terminalgui colors

-- general
vim.opt.clipboard = 'unnamedplus' -- use system clipboard by default
vim.opt.timeoutlen = 250 -- milliseconds to wait for code sequence
vim.opt.undodir = os.getenv("HOME") .. '/.config/nvim/undo' -- undo locatoin
vim.opt.undofile = true -- persistent undo

-- search
vim.opt.ignorecase = true -- ignore case 
vim.opt.smartcase = true -- don't ignore case if specified 

-- code
vim.opt.tabstop = 2 -- number of spaces a tab takes
vim.opt.shiftwidth = 2 -- number of characters used for indentation
vim.opt.softtabstop = 2 -- number of spaces a tab counts when editing
vim.opt.expandtab = true -- transform tab to spaces
vim.opt.wrap = true -- wrap lines
vim.opt.breakindent = true -- keep wraped lines indented

-- global variables
vim.g.mapleader = " " -- map leader to space bar
vim.g.python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/3.10.1/bin/python3' -- python path
vim.g.loaded_python_provider = 0 -- disable Python2 support
vim.g.loaded_perl_provider = 0 -- disable perl provider
vim.g.loaded_ruby_provider = 0 -- disable ruby provider
vim.g.loaded_node_provider = 0 -- disable node provider


-- netwr style
--  vim.g.netrw_liststyle = '3'
--  vim.g.netrw_altv = '1'

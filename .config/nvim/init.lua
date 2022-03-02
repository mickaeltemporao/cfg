require 'packer'.startup(
    function(use)
        -- use 'lewis6991/impatient.nvim'
        use 'wbthomason/packer.nvim' -- Package manager
        use 'nvim-lualine/lualine.nvim'
        use 'mofiqul/dracula.nvim'
        use 'vincentcordobes/vim-translate'
    end
)

-- lualine
require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Use system clipboard by default
vim.o.clipboard = 'unnamedplus'

-- Persistent undo
vim.o.undofile = true
vim.o.undodir = '~/.config/nvim/undo'

-- Ignore case
vim.o.ic = true

-- Show line numbers
vim.o.number = true

-- Highlight over length lines
vim.o.colorcolumn = '80'

-- Break line at predefined characters
vim.o.linebreak = true
-- Character to show before the lines that have been soft-wrapped
vim.o.showbreak = '↪'

--Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme dracula]]

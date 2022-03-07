-- Set options
local options = {

  clipboard = 'unnamedplus', -- Use system clipboard by default
  colorcolumn = '80', -- Highlight over length lines
  ic = true, -- Ignore case
  linebreak = true, -- Break line at predefined characters
  number = true, -- Show line numbers
  showbreak = '↪', -- Character to show before when soft-wrap
  termguicolors = true, --Set colorscheme
  undodir = os.getenv("HOME") .. '/.config/nvim/undo', -- Undo locatoin
  undofile = true, -- Persistent undo
  hidden = true, -- Navigate between buffers without saving
  expandtab = true, -- Use spaces instead of tabs
  shiftwidth = 4, -- Replace tab with 4 spaces
  tabstop = 4, -- Replace tab with 4 spaces

}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Set color scheme
vim.cmd [[colorscheme dracula]]

-- Read .pdf, .doc, .odt, .rtf in vim!
vim.cmd(
  [[
    autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout
  ]]
)

-- Delete Trailing Whitespaces
vim.cmd(
  [[
    autocmd BufWritePre * :%s/\s\+$//e
  ]]
)

-- Assigning global variables
local global_vars = {

  mapleader = ' ', -- Map leader to space bar
  -- netwr style
  netrw_liststyle = '3',
  netrw_altv = '1',
  -- coding env setup
  python_host_prog = '/usr/bin/python',
  python3_host_prog = os.getenv("HOME") .. '/.pyenv/versions/3.10.1/bin/python3',
  loaded_python_provider = 0, -- Disable Python2 support
  loaded_perl_provider = 0, -- " Disable perl provider
  loaded_ruby_provider = 0, -- " Disable ruby provider
  loaded_node_provider = 0, -- Disable node provider
  -- vimwiki setup
  vimwiki_list = {
      {
          path = '~/Documents/notes',
          syntax = 'markdown',
          ext = '.md',
      }
  },
}

for k, v in pairs(global_vars) do
  vim.g[k] = v
end


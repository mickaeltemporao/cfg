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

}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[colorscheme dracula]]

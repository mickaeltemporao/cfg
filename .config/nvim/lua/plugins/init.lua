return {
  -- Configless Plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'jamessan/vim-gnupg',
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
  },
  {
    "folke/zen-mode.nvim",
  },
  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  -- Syntax highlighting, matching rules for markdown
  {
    'preservim/vim-markdown',
    dependencies = {
      'godlygeek/tabular'
    }
  },
  -- Notepad
  {
    'lervag/wiki.vim',
    config = function()
      vim.g.wiki_root = '~/Documents/notes'
    end
  },
}


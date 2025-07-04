return {
  -- Configless Plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'folke/zen-mode.nvim',
  'jamessan/vim-gnupg',
  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
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
  {
    'lervag/wiki.vim',
    config = function()
      vim.g.wiki_root = '~/Documents/notes'
    end
  },
}


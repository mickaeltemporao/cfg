return {
  -- Configless Plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'folke/zen-mode.nvim',
  'jamessan/vim-gnupg',

  -- Shortcuts helper
  {
    "folke/which-key.nvim",
    lazy = true,
    keys = function ()
      -- document existing key chains
      require('which-key').add {
        { "<leader>c", group = "[C]ode" },
        { "<leader>c_", hidden = true },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>d_", hidden = true },
        { "<leader>g", group = "[G]it" },
        { "<leader>g_", hidden = true },
        { "<leader>h", group = "Git [H]unk" },
        { "<leader>h_", hidden = true },
        { "<leader>r", group = "[R]ename" },
        { "<leader>r_", hidden = true },
        { "<leader>s", group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>t_", hidden = true },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>w_", hidden = true },
    }
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').add {
        { "<leader>", group = "VISUAL <leader>", mode = "v" },
        { "<leader>h", desc = "Git [H]unk", mode = "v" },
      }
    end
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        -- api_key_cmd = "pass gpt-manchester"
        -- api_key_cmd = "pass gpt-private"
        api_key_cmd = "pass gpt-ced"
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
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
  }
}


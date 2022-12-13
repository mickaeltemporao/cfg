-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- Returns the config file
local function get_config(name)
  return string.format("require('plugins/%s')", name)
end

require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim" -- Package manager
    use "folke/tokyonight.nvim" -- Color scheme
    use { -- Fancier statusline
      "nvim-lualine/lualine.nvim" ,
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = require("config.lualine"),
    }
    use { -- Color highlighter
      "norcalli/nvim-colorizer.lua",
      config = require("config.colorizer"),
    }
    use { -- Working with blank lines 
      "lukas-reineke/indent-blankline.nvim",
      config = require("config.indent-blankline"),
    }
    use { -- Smart comments
      "numToStr/Comment.nvim",
      config = require("Comment").setup()
    }
    use { -- Treesitter parser
      "nvim-treesitter/nvim-treesitter",
      run = function()
        pcall(require("nvim-treesitter.install").update { with_sync = true })
      end,
      config = require("config.treesitter"),
    }
    use { -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    }
    use { -- Extendable fuzzy finder
      "nvim-telescope/telescope.nvim", branch = "0.1.x",
      requires = {"nvim-lua/plenary.nvim"},
      config = require("config.telescope"),
    }
  end
)


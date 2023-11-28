-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim" -- Package manager
    use "folke/tokyonight.nvim" -- Color scheme
    use { -- Fancier statusline
      "nvim-lualine/lualine.nvim" ,
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("config.lualine")
      end
    }
    use { -- Color highlighter
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("config.colorizer")
      end
    }
    use { -- Shortcuts helper
      "folke/which-key.nvim",
      config = require("which-key").setup()
    }
    use { -- REPL
      "vigemus/iron.nvim",
      config = function()
        require("config.iron")
      end
    }
    use { -- Treesitter parser
      "nvim-treesitter/nvim-treesitter",
      run = function()
        pcall(require("nvim-treesitter.install").update { with_sync = true })
      end,
      config = function()
        require("config.treesitter")
      end
    }
    use { -- Additional text objects via treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    }
    use { -- Extendable fuzzy finder
      "nvim-telescope/telescope.nvim", branch = "0.1.x",
      requires = {
        {"nvim-lua/plenary.nvim"},
      },
      config = function()
        require("config.telescope")
      end
    }
    use { "nvim-telescope/telescope-bibtex.nvim",
      requires = {
        {"nvim-telescope/telescope.nvim"},
      },
    }
    use { "folke/zen-mode.nvim",
    }
  end
)


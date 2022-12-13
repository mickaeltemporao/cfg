require("nvim-treesitter.configs").setup {
  ensure_installed = { 
    "awk", "bash", "bibtex", "c", "cmake", "cpp", "dockerfile", "go", "help",
    "html", "java", "javascript", "json", "julia", "latex", "lua", "markdown",
    "markdown_inline", "python", "r", "rust", "toml", "typescript", "yaml",
    "vim",
  },
  highlight = { enable = true },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = { query = "@function.outer", desc = "Select inner part of a function region" },
        ["if"] = { query = "@function.inner", desc = "Select outer part of a function class region" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
  },
}


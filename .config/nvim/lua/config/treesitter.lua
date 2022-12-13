require("nvim-treesitter.configs").setup {
  ensure_installed = { 
    "awk", "bash", "bibtex", "c", "cmake", "cpp", "dockerfile", "go", "help",
    "html", "java", "javascript", "json", "julia", "latex", "lua", "markdown",
    "python", "r", "rust", "toml", "typescript", "yaml",
  },
  highlight = { enable = true },
}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "%_files", "%_cache", ".git/", "site_libs" },
    layout_strategy = "flex",
  }
}


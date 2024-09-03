-- Color highlighter
return { 
  "norcalli/nvim-colorizer.lua",
  opts = 
    { 
      css = { css_fn = true, css = true },
      "html",
      "javascript",
      "julia",
      "markdown",
      "python",
      "qmd",
      "r",
    }
}

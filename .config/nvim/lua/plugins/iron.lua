-- REPL
return { 
  "vigemus/iron.nvim",
  ft = { 'julia', 'python', 'r'},
  config = function()
    require("iron.core").setup {
      config = {
        repl_definition = {
          sh = {
            command = {"zsh"}
          },
          python = {
            command = {
              "ipython",
              "--no-autoindent",
              "--matplotlib=qt6",
              "--ipython-dir=" .. os.getenv("HOME") .. "/.config/ipython",
              "--profile=mt",
            },
            format = require("iron.fts.common").bracketed_paste,
          },
        },
        repl_open_cmd = require('iron.view').split.vertical.botright("50%")
      }
    }
  end
}

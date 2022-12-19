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
          "--matplotlib=qt5",
          "--ipython-dir=/home/mt/.config/ipython",
          "--profile=mt",
        }
      },
    }
  }
}

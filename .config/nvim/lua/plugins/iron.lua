-- REPL
return { 
  "vigemus/iron.nvim",
  ft = { 'julia', 'python', 'r'},
  config = function()
    require("iron.core").setup {
      config = {
        repl_definition = {
          sh = {
            command = {"bash"}
          },
          python = {
            command = {
              "ipython",
              "--no-autoindent",
              "--ipython-dir=" .. os.getenv("HOME") .. "/.config/ipython",
              "--profile=mt",
            },
            format = require("iron.fts.common").bracketed_paste,
          },
        },
        repl_open_cmd = {
          require("iron.view").split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
          require("iron.view").split.rightbelow("%25")  -- cmd_2: open a repl below
        },
      },
      keymaps = {
        send_file = "<space>rf",
        toggle_repl_with_cmd_1 = "<space>rv",
        toggle_repl_with_cmd_2 = "<space>rh",
        restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
--        send_line = "<space><CR>",
        visual_send = "<space><CR>",
        -- send_motion = "<space>c",
        send_paragraph = "<space>rp",
        send_until_cursor = "<space>ru",
        send_mark = "<space>rm",
        send_code_block = "<space>rb",
        send_code_block_and_move = "<space>rn",
        mark_motion = "<space>mr",
        mark_visual = "<space>mr",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>rq",
        clear = "<space>rl",
      },
      highlight = {
        italic = true
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }
  end
}


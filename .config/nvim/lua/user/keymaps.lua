local wk = require("which-key")
local ic = require("iron.core")

-- Send line to REPL and go to next line
local send_line_and_down = function()
  local last_line = vim.fn.line("$")
  local pos = vim.api.nvim_win_get_cursor(0)
  ic.send_line()
  vim.api.nvim_win_set_cursor(0, { math.min(pos[1] + 1, last_line), pos[2] })
end

local send_visual = function()
  ic.mark_visual()
  ic.send_mark()
end 

local send_whole = function()
  ic.send_file()
end 

local quit_repl = function()
  ic.close_repl()
end

-- REPL Keymaps
vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>', {desc = '[R]EPL [S]tart'})
vim.keymap.set('n', '<leader>rq', quit_repl) -- TODO: Quit REPL
vim.keymap.set('n', '<c-cr>', send_line_and_down)
vim.keymap.set('n', '<leader>rf', send_whole)
vim.keymap.set('n', '<s-cr>', function() require("iron.core").send_line() end)
vim.keymap.set('i', '<c-cr>', send_line_and_down)
vim.keymap.set('i', '<s-cr>', function() require("iron.core").send_line() end)
vim.keymap.set('v', '<c-cr>', send_visual)

wk.register(
  {
    ["<leader>"] = {
      f = {
        name = "Find operations",
        b = { require("telescope.builtin").buffers, "[F]ind [B]uffers" },
        d = { require("telescope.builtin").diagnostics, "[F]ind [D]iagnostics" },
        f = { require("telescope.builtin").find_files, "[F]ind [F]iles" },
        g = { require("telescope.builtin").live_grep, "[F]ind by [G]rep" },
        h = { require("telescope.builtin").help_tags, "[F]ind [H]elp" },
        o = { require("telescope.builtin").oldfiles, "[F]ind [O]ld files" },
      }
    }
  }, 
  {
    mode = "n"
  }
)

-- vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = '[F]ind open [B]uffers' })
-- vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = '[F]ind [D]iagnostics' })
-- vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = '[F]ind [F]iles' })
-- vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = '[F]ind by [G]rep' })
-- vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = '[F]ind [H]elp' })
-- vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = '[F]ind [O]ld files' })

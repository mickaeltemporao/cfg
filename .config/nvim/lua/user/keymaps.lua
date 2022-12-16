local wk = require("which-key")

vim.g.mapleader = " "

-- vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = '[F]ind open [B]uffers' })
-- vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = '[F]ind [D]iagnostics' })
-- vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = '[F]ind [F]iles' })
-- vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = '[F]ind by [G]rep' })
-- vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = '[F]ind [H]elp' })
-- vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = '[F]ind [O]ld files' })

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


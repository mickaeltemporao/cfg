vim.g.mapleader = " "

vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = '[F]ind open [B]uffers' })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = '[F]ind [O]ld files' })

vim.keymap.set("n", "<leader>ph", function() print("Hi!") end, {desc = "Test"})


vim.api.nvim_set_keymap('v', 'T', ":'<,'>TranslateReplace en:fr<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'T', ":Translate en:fr<CR>", {noremap = true, silent = true})


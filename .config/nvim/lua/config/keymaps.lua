local wk = require("which-key")
local ic = require("iron.core")
local hm = os.getenv("HOME")

local pdf = "<cmd>w<CR><cmd>!pandoc --citeproc --bibliography="
  .. hm
  .. "/references.bib --variable papersize=a4paper -s % -o  /tmp/output.pdf<CR><CR>"
local doc = "<cmd>w<CR><cmd>!pandoc --citeproc --bibliography="
  .. hm
  .. "/references.bib -s % -o /tmp/output.rtf<CR><CR>"
local tex = "<cmd>w<CR><cmd>!textopdf % <CR><CR>"

-- local function rendertyp()
--   local filepath = vim.fn.expand("%:p")
--   vim.fn.jobstart({"openwatch", filepath}, {
--     detach = true,
--   })
-- end
--
-- Send line to REPL and go to next line
local send_line_and_down = function()
  local last_line = vim.fn.line("$")
  local pos = vim.api.nvim_win_get_cursor(0)
  ic.send_line()
  vim.api.nvim_win_set_cursor(0, { math.min(pos[1] + 1, last_line), pos[2] })
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

local function fuzzy_search()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

-- TODO: Maybe allow for grep in files? 
local function search_notes()
  require('telescope.builtin').find_files {
    cwd = hm .. '/Documents/notes/',
    -- sorting_strategy = 'ascending',
  }
end

local function search_config()
  require('telescope.builtin').find_files {
    cwd = hm .. '/.config/nvim/lua/',
  }
end


vim.keymap.set("n", "<leader><CR>", send_line_and_down) -- REPL 
vim.keymap.set("n", "<C-c>", ":ChatGPT<CR>") -- ChatGPT Keymaps
vim.keymap.set("i", "<C-Tab>", "<esc>:bn<CR>")
vim.keymap.set("n", "<C-Tab>", ":bn<CR>")
vim.keymap.set("i", "<C-S-Tab>", "<esc>:bp<CR>")
vim.keymap.set("n", "<C-S-Tab>", ":bp<CR>")
vim.keymap.set("n", "<b>", ":<CR>")
vim.keymap.set("i", "<C-c>", "<esc>:Telescope bibtex<CR>")


wk.add{
  { "<leader>r", group = "[R]ender Openrations" },
}

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "typst",
--   callback = function()
--     local wk = require("which-key")
--     wk.add{
--       { "<leader>rf", rendertyp, desc = "Watch and open Typst PDF" },
--     }
--   end,
--   }
-- )

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local wk = require("which-key")
    wk.add{
      { "<leader>rf", pdf, desc = "Render file to PDF" },
      { "<leader>rd", doc, desc = "Render file to DOC" },
    }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "plaintex",
  callback = function()
    local wk = require("which-key")
    wk.add{
      { "<leader>rf", tex, desc = "Render file to PDF" },
    }
  end,
})


vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>o', require('telescope.builtin').oldfiles, { desc = 'Find recently [O]pened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', fuzzy_search, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sn', search_notes, { desc = '[S]earch [N]notes' })
vim.keymap.set('n', '<leader>sc', search_config, { desc = '[S]earch [C]onfig' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


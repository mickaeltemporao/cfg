local ic = require("iron.core")
local hm = os.getenv("HOME")

local pdf = "<cmd>w<CR><cmd>!pandoc --citeproc --bibliography="
  .. hm
  .. "/references.bib --variable papersize=a4paper -s % -o  /tmp/output.pdf<CR><CR>"
local doc = "<cmd>w<CR><cmd>!pandoc --citeproc --bibliography="
  .. hm
  .. "/references.bib -s % -o /tmp/output.rtf<CR><CR>"
local tex = "<cmd>w<CR><cmd>!textopdf % <CR><CR>"


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

vim.keymap.set('n', '<leader>r', '<Nop>', { desc = "[R]ender Openrations" })

vim.keymap.set("n", "<leader><CR>", send_line_and_down) -- REPL 


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

vim.keymap.set("i", "<C-c>", "<esc>:Telescope bibtex<CR>")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set('n', '<leader>rf', pdf, { desc = "[R]ender file to PDF" })
    vim.keymap.set('n', '<leader>rd', doc, { desc = "[R]ender file to DOC" })
  end,
})


vim.api.nvim_create_autocmd(
  "FileType", 
  {
    pattern = "plaintex",
    callback = function()
      vim.keymap.set('n', '<leader>rf', pdf, { desc = "[R]ender file to PDF" })
    end,
  }
)


vim.api.nvim_create_user_command(
  'LiveGrepGitRoot', 
  live_grep_git_root, 
  { desc = "Live to search in git root" }
)

-- Break sentence into its own line. 
vim.keymap.set('n', '<leader>j', ')hr<CR><Esc>zz', { desc = 'Break sentence and move down' })

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<leader>o', require('telescope.builtin').oldfiles, { desc = 'Find recently [O]pened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', fuzzy_search, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>f/', telescope_live_grep_open_files, { desc = '[F]ind [/] in Open Files' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').builtin, { desc = '[F]ind [S]elect Telescope' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = '[G]it [F]iles' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[F]ind by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>fn', search_notes, { desc = '[F]ind [N]notes' })
vim.keymap.set('n', '<leader>f,', search_config, { desc = '[F]ind [C]onfig' })
vim.keymap.set('n', '<leader>f', '<Nop>', { desc = '[F]ind Operations' })
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[F]earch [D]iagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


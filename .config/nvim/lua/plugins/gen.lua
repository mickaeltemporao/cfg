return {
  "David-Kunz/gen.nvim",
  config = function()
    require('gen').setup {
      model = "mistral-small3.2:24b",
      display_mode = "vertical-split", -- The display mode. Can be "float" or "split" or "horizontal-split" or "vertical-split".
      show_prompt = "full", -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      result_filetype = "markdown", -- Configure filetype of the result buffer
    }
    local prompt = require('misc.prompts')

    require('gen').prompts['1-Chat'] = { prompt = "$input", model = "gpt-oss:20b"}
    require('gen').prompts['2-Synonyms'] = { prompt = prompt.synonyms, model = "gpt-oss:20b"}
    require('gen').prompts['3-Fix'] = { prompt = prompt.fix, model = "gpt-oss:20b" }
    require('gen').prompts['4-Ask'] = { prompt = prompt.ask, model = "gpt-oss:20b"}
    require('gen').prompts['Change'] = { prompt = "Change the following text, $input:\n$text", replace = true, model = "qwen3:32b"}
    require('gen').prompts['Enhance_Grammar_Spelling'] = { prompt = prompt.proofread, model = "gpt-oss:20b", }
    require('gen').prompts['Enhance_Wording'] = { prompt = prompt.wording, model = "qwen3:32b", }
    require('gen').prompts['Generate'] = { prompt = "$input", replace = true }
    require('gen').prompts['Make_Concise'] = { prompt = prompt.concise, replace = true}
    require('gen').prompts['Medical'] = { prompt = prompt.medical, model = "qwen3:32b", }
    require('gen').prompts['Summarize'] = { prompt = prompt.summarize}
    
    vim.keymap.set({'n', 'v'}, '<leader>]', ':Gen<CR>')
    vim.keymap.set('n', '<leader>[', ':Gen Chat<CR>')
    -- vim.keymap.set({ "n" }, "<C-g", "<cmd>'<,'>Gen<cr>", { noremap = true, silent = true })
    -- vim.keymap.set({ "v" }, "<C-g", "<cmd> Gen<cr>", { noremap = true, silent = true })
    -- vim.keymap.set({ "n", "i" }, "LocalLeader>g", "<cmd> Gen Chat<cr>", { noremap = true, silent = true })

  end
}

return {
  "robitx/gp.nvim",
  config = function()
    local conf = {
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = { "pass", "gpt-private"},
        },
      },
      agents = {
        {
          name = "ChatGPT4o",
          disable = true,
        },
        {
          provider = "openai",
          name = "ChatGPT-o3-mini",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "o3-mini", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "openai",
          name = "ChatGPT-o4-mini",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "o4-mini", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
      }
    }
    require("gp").setup(conf)
  end,
}




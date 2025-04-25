local plugins = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function() 
    require("copilot").setup({
      panel = {
        auto_refresh = false,
        keymap = {
          accept = "<M-CR>",
          jump_prev = "[[",
          jump_next = "]]",
          refresh = "gr",
          open = "<M-CR>",
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          prev = "<M-[>",
          next = "<M-]>",
          dismiss = "<C-]>",
        },
      },
    })
  end,
}
return plugins

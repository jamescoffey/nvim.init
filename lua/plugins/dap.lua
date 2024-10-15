


local plugins = {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require("dap")
      vim.keymap.set('n', '<Localleader>db', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Localleader>dc', dap.continue, {})
    end,
  },
  {
    "nvim-neotest/nvim-nio", 
    dependencies = {"rcarriga/nvim-dap-ui"},
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {'mfussenegger/nvim-dap',
                    "nvim-neotest/nvim-nio"}, 
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = "python",
    dependencies = {'mfussenegger/nvim-dap',
                    'rcarriga/nvim-dap-ui',
                    "nvim-neotest/nvim-nio"}, 
  },
}
return plugins




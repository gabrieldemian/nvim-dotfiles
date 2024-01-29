return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    keys = {
      { "<leader>dt", ":DapToggleBreakpoint<CR>" },
      { "<leader>dx", ":DapTerminate<CR>" },
      { "<leader>do", ":DapStepOver<CR>" },
      { "<leader>di", ":DapStepInto<CR>" },
      { "<leader>dc", ":DapContinue<CR>" },
    },
    config = function()
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
}

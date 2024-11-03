return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()

      -- -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = "dlv",
      --     args = { "dap", "-l", "127.0.0.1:${port}" },
      --   },
      -- }

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "Debug: Breakpoint" })
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Debug: Run to cursor" })

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { desc = "Debug: Eval var under cursor", enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue, { desc = "Debug: Continue" })
      vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Debug: Step into" })
      vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Debug: Step over" })
      vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Debug: Step out" })
      vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Debug: Step back" })
      vim.keymap.set("n", "<F13>", dap.restart, { desc = "Debug: Restart" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}

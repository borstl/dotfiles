return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
  },
  keys = {
    {
      "<leader>dbp",
      function()
        require("dap-python").test_method()
      end,
      desc = "Debug Python Run",
      ft = "python",
    },
  },
  config = function()
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)
  end,
}

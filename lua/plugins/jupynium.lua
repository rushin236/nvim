return {
  "kiyoon/jupynium.nvim",
  build = "pip install --user .",
  dependecies = {
    "rcarriga/nvim-notify",   -- optional
    "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  },
  config = function()
    local jupynium = require("jupynium")
    jupynium.setup({
      --- For Conda environment named "jupynium",
      python_host = vim.g.python3_host_prog or "python",
      -- python_host = vim.g.python3_host_prog or "python",
      default_notebook_URL = "localhost:8888",
    })
  end,
}

return {
  "kiyoon/jupynium.nvim",
  build = "pip install --user .",
  dependecies = {
    "rcarriga/nvim-notify", -- optional
    "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  },
  config = function()
    require("jupynium").setup({
      python_host = vim.g.python3_host_prog or "python3",
    })
  end,
}

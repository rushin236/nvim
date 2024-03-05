return {
  "kiyoon/jupynium.nvim",
  -- build = "pip install .",
  build = "conda run --no-capture-output -n jupynium pip install .",
  enabled = vim.fn.isdirectory(vim.fn.expand("~/anaconda3/envs/jupynium")),
  dependecies = {
    "rcarriga/nvim-notify", -- optional
    "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  },
  config = function()
    local jupynium = require("jupynium")
    jupynium.setup({
      --- For Conda environment named "jupynium",
      python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
      -- python_host = vim.g.python3_host_prog or "python",

      default_notebook_URL = "localhost:8888/nbclassic",

      jupyter_command = "jupyter",
      --- For Conda, maybe use base environment
      --- then you can `conda install -n base nb_conda_kernels` to switch environment in Jupyter Notebook
      -- jupyter_command = { "conda", "run", "--no-capture-output", "-n", "base", "jupyter" },
    })
  end,
}

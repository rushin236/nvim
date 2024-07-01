return {
  "kiyoon/jupynium.nvim",
  build = "conda run --no-capture-output -n jupynium pip install .",
  enabled = vim.fn.isdirectory(vim.fn.expand("~/miniconda3/envs/jupynium")),
  dependecies = {
    "rcarriga/nvim-notify", -- optional
    "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
  },
  config = function()
    require("jupynium").setup({
      --- For Conda environment named "jupynium",
      python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
    })
  end,
}

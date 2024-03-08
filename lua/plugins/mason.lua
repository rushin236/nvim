return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "black",
        "isort",
        "ruff",
        "pyright",
        "ruff-lsp",
        "python-lsp-server",
        "prettier",
      },
    },
  },
}

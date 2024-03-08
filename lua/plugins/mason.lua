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
        "pylint",
        "pyright",
        "ruff-lsp",
        "python-lsp-server",
        "ruff",
        "prettier",
      },
    },
  },
}

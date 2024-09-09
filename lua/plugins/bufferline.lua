return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    { "echasnovski/mini.bufremove", version = "*" },
    {
      "ojroques/nvim-bufdel",
      config = function()
        require("bufdel").setup({
          next = "tabs",
          quit = true,
        })
      end,
    },
  },
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
    { "<leader>bd", "<cmd>BufDel<cr>", desc = "Delete Current Buffer" },
    { "<leader>bs", "<Cmd>BufferLinePick<CR>", desc = "Selete buffers" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
          separator = true, -- use a "true" to enable the default, or set your own character
        },
      },
    },
  },
}

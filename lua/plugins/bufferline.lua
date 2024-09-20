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
          quit = false, -- Prevent quitting Neovim when the last buffer is deleted
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
    { "<leader>bs", "<Cmd>BufferLinePick<CR>", desc = "Select buffers" },
    { "<leader>br", "<Cmd>e!<CR>", desc = "Reload buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    -- Updated <leader>bd to delete the buffer and move to the next or previous buffer
    {
      "<leader>bd",
      function(n)
        -- Delete the current buffer and move to next or previous
        require("mini.bufremove").delete(n, false)

        if vim.fn.bufnr("$") == 1 then
          -- If it's the last buffer, open the explorer
          vim.cmd("NvimTreeOpen")
        else
          -- Switch to the next or previous buffer after deletion
          vim.cmd("BufferLineCycleNext")
        end
      end,
      desc = "Delete buffer and switch",
    },
  },
  opts = {
    options = {
      close_command = function(n)
        local bufdelete = require("mini.bufremove").delete
        bufdelete(n, false)
        -- Open NvimTree if it's the last buffer
        if vim.fn.bufnr("$") == 1 then
          vim.cmd("NvimTreeOpen")
        end
      end,
      right_mouse_command = function(n)
        local bufdelete = require("mini.bufremove").delete
        bufdelete(n, false)
        -- Open NvimTree if it's the last buffer
        if vim.fn.bufnr("$") == 1 then
          vim.cmd("NvimTreeOpen")
        end
      end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "left",
          separator = true,
        },
      },
    },
  },
}

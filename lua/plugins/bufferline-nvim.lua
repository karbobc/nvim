return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "BufferLine Cycle Next" },
    { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "BufferLine Cycle Prev" },
    { "<leader>w", "<cmd>bdelete<cr>", desc = "BufferLine Buffer Delete" },
  },
  opts = {
    options = {
      close_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      right_mouse_command = nil,
      middle_mouse_command = nil,
      close_icon = "",
      buffer_close_icon = "",
      indicator = { icon = "▎", style = "icon" },
      modified_icon = "●",
      left_trunc_marker = "",
      right_trunc_marker = "",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "undotree",
          text = "Undo Tree",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
  config = function(_, opts)
    local plugin = require("bufferline")
    plugin.setup(opts)
  end,
}

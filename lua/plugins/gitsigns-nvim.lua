return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  event = "VeryLazy",
  keys = {
    { "<leader>gst", "<cmd>Gitsigns toggle_signs<cr>", desc = "Gitsigns Toggle Signs" },
    { "<leader>gsn", "<cmd>Gitsigns toggle_numhl<cr>", desc = "Gitsigns Toggle Number Hightlight" },
    { "<leader>gsl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Gitsigns Toggle Line Hightlight" },
    { "<leader>gsw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Gitsigns Toggle Word Diff" },
  },
  opts = {
    current_line_blame = true,
    current_line_blame_formatter = "<author>, <author_time:%Y/%m/%d %H:%M> • <summary>",
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 0,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
  },
  config = function(_, opts)
    local plugin = require("gitsigns")
    plugin.setup(opts)
  end,
}

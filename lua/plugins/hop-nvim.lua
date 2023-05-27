return {
  "phaazon/hop.nvim",
  lazy = true,
  branch = "v2",
  keys = {
    { "<leader>hc", "<cmd>HopChar1<cr>", desc = "Hop One Char" },
    { "<leader>hl", "<cmd>HopLine<cr>", desc = "Hop Line" },
    { "<leader>hv", "<cmd>HopVertical<cr>", desc = "Hop Vertical" },
    { "<leader>hw", "<cmd>HopWord<cr>", desc = "Hop Word" },
    { "<leader>ha", "<cmd>HopAnywhere<cr>", desc = "Hop Anywhere" },
    { "<leader>hp", "<cmd>HopPattern<cr>", desc = "Hop Pattern" },
    { "f", "<cmd>HopChar1CurrentLineAC<cr>", desc = "Hop One Char On The Current Line After The Cursor" },
    { "F", "<cmd>HopChar1CurrentLineBC<cr>", desc = "Hop One Char On The Current Line Before The Cursor" },
  },
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  config = function(_, opts)
    local plugin = require("hop")
    plugin.setup(opts)
  end,
}

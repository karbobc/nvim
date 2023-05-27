return {
  "numToStr/Navigator.nvim",
  lazy = true,
  keys = {
    { "<c-h>", "<cmd>NavigatorLeft<cr>", desc = "Navigator Left" },
    { "<c-l>", "<cmd>NavigatorRight<cr>", desc = "Navigator Right" },
    { "<c-k>", "<cmd>NavigatorUp<cr>", desc = "Navigator Up" },
    { "<c-j>", "<cmd>NavigatorDown<cr>", desc = "Navigator Down" },
  },
  config = function()
    local plugin = require("Navigator")
    plugin.setup()
  end,
}

return {
  "folke/which-key.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },
  config = function(_, opts)
    local plugin = require("which-key")
    plugin.setup(opts)
  end,
}

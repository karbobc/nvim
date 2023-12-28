return {
  "hiphish/rainbow-delimiters.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    local plugin = require("rainbow-delimiters.setup")
    plugin.setup(opts)
  end
}

return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    scope = {
      enabled = false,
    },
  },
  config = function(_, opts)
    local plugin = require("ibl")
    plugin.setup(opts)
  end,
}

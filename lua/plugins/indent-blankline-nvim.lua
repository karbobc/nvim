return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
  },
  config = function(_, opts)
    local plugin = require("indent_blankline")
    plugin.setup(opts)
  end,
}

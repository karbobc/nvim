return {
  "numToStr/Comment.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local plugin = require("Comment")
    plugin.setup()
  end
}

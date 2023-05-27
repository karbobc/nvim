return {
  "windwp/nvim-autopairs",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local plugin = require("nvim-autopairs")
    plugin.setup()
  end,
}

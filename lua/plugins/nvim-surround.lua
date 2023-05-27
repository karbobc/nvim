return {
  "kylechui/nvim-surround",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local plugin = require("nvim-surround")
    plugin.setup()
  end
}

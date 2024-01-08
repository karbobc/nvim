return {
  "folke/flash.nvim",
  lazy = true,
  event = "VeryLazy",
  opts ={
    modes = {
      char = {
        -- disable f F t T motions
        keys = {},
      },
    },
  },
  keys = {
    { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
  config = function(_, opts)
    local plugin = require("flash")
    plugin.setup(opts)
  end,
}

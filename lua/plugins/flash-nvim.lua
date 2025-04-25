return {
  "folke/flash.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = {
    label = {
      -- show the label after the match
      after = false, ---@type boolean|number[]
      -- show the label before the match
      before = true, ---@type boolean|number[]
      -- position of the label extmark
      style = "overlay", ---@type "eol" | "overlay" | "right_align" | "inline"
    },
    modes = {
      char = {
        -- disable f F t T motions
        keys = {},
      },
    },
  },
  keys = {
    { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
    { "F", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  },
  config = function(_, opts)
    local plugin = require("flash")
    plugin.setup(opts)
  end,
}

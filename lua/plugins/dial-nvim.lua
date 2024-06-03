return {
  "monaqa/dial.nvim",
  lazy = true,
  event = "VeryLazy",
  keys = {
    { "<c-a>", function() require("dial.map").inc_normal("default") end, mode = { "n" }, "Dial Increment" },
    { "<c-x>", function() require("dial.map").dec_normal("default") end, mode = { "n" }, "Dial Decrement" },
    { "<c-a>", function() require("dial.map").inc_visual("default") end, mode = { "v" }, "Dial Increment" },
    { "<c-x>", function() require("dial.map").dec_visual("default") end, mode = { "v" }, "Dial Decrement" },
  },
  opts = function ()
    local augend = require("dial.augend")
    return {
      default = {
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%H:%M:%S"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.bool,
        augend.constant.new { elements = { "let", "const" } },
        augend.constant.new { elements = { "and", "or" } },
        augend.constant.new { elements = { "&&", "||" }, word = false },
        augend.constant.new { elements = { "&", "|" }, word = false },
      },
    }
  end,
  config = function(_, opts)
    require("dial.config").augends:register_group(opts)
  end
}

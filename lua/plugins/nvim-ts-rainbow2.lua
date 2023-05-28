return {
  "HiPhish/nvim-ts-rainbow2",
  lazy = true,
  event = "VeryLazy",
  config = function(_, opts)
    local plugin = require("nvim-treesitter.configs")
    plugin.setup({
      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = {},
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        strategy = require("ts-rainbow").strategy.global,
      },
    })
  end,
}

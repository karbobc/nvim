return {
  "Mofiqul/vscode.nvim",
  lazy = true,
  event = "BufEnter",
  config = function()
    local plugin = require("vscode")
    plugin.setup({
      -- Enable transparent background
      transparent = true,
      -- Enable italic comment
      italic_comments = true,
      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,
      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {},
      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {},
    })
    plugin.load()
  end,
  priority = 1000,
}

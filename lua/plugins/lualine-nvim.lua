return {
  "nvim-lualine/lualine.nvim",
  lazy = true,
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = "vscode",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "diagnostics" },
        lualine_x = { "encoding" },
        lualine_y = { "progress" },
        lualine_z = { "%l/%L" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {
        "man",
        "fzf",
        "fugitive",
        "nvim-tree",
        "toggleterm",
        "lazy",
      },
    }
  end,
}

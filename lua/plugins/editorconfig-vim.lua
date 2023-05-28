return {
  "editorconfig/editorconfig-vim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    vim.g.EditorConfig_exclude_patterns = {
      "fugitive://.*",
      "scp://.*",
    }
  end,
}

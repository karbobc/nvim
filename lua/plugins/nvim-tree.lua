return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  keys = {
    {  "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Toggle" },
  },
  opts = {
    sort_by = "case_sensitive",
    view = {
      adaptive_size = false,
      mappings = {
        custom_only = false,
        list = {},
      }
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
    },
    filters = {
      dotfiles = false,
      custom = { "^.git$" },
      exclude = { "^.gitignore$" },
    },
  },
  config = function(_, opts)
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- setup with options
    local plugin = require("nvim-tree")
    plugin.setup(opts)
  end,
}

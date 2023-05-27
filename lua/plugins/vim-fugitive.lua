return {
  "tpope/vim-fugitive",
  lazy = true,
  keys = {
    { "<leader>gg", "<cmd>GitGutterToggle<cr>", desc = "Git Gutter Toggle" },
    { "<leader>gbb", "<cmd>GitGutterBufferToggle<cr>", desc = "Git Gutter Buffer Toggle" },
    { "<leader>gss", "<cmd>GitGutterSignsToggle<cr>", desc = "Git Gutter Signs Toggle" },
    { "<leader>glh", "<cmd>GitGutterLineHighlightsToggle<cr>", desc = "Git Gutter Line Highlights Toggle" },
    { "<leader>ghn", "<Plug>(GitGutterNextHunk)", desc = "Git Gutter Next Hunk" },
    { "<leader>ghp", "<Plug>(GitGutterPrevHunk)", desc = "Git Gutter Prev Hunk" },
    { "<leader>ghs", "<Plug>(GitGutterStageHunk)", desc = "Git Gutter Stage Hunk" },
    { "<leader>ghu", "<Plug>(GitGutterUndoHunk)", desc = "Git Gutter Undo Hunk" },
  }
}

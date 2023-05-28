return {
  "ojroques/vim-oscyank",
  lazy = true,
  keys = {
    { "<leader>y", "<cmd>OSCYankVisual<cr>", desc = "OSC Yank" },
  },
  config = function()
    vim.g.oscyank_term = "default"
  end,
}

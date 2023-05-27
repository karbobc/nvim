return {
  {
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    "junegunn/fzf.vim",
    lazy = true,
    keys = {
      { "<leader>ff", "<cmd>Files<cr>", desc = "FZF Files" },
      { "<leader>fl", "<cmd>Lines<cr>", desc = "FZF Lines" },
      { "<leader>fbl", "<cmd>BLines<cr>", desc = "FZF Buffer Lines" },
      { "<leader>ft", "<cmd>Tags<cr>", desc = "FZF Tags" },
      { "<leader>fbt", "<cmd>BTags<cr>", desc = "FZF Buffer Tags" },
      { "<leader>fh", "<cmd>History<cr>", desc = "FZF History" },
      { "<leader>fmk", "<cmd>Marks<cr>", desc = "FZF Marks" },
      { "<leader>fmp", "<cmd>Maps<cr>", desc = "FZF Maps" },
      { "<leader>fgf", "<cmd>GFiles<cr>", desc = "FZF Git Files (git ls-files)" },
      { "<leader>fgs", "<cmd>GFiles?<cr>", desc = "FZF Git Files (git status)" },
      { "<leader>fgc", "<cmd>Commits<cr>", desc = "FZF Git Commits" },
      { "<leader>fgbc", "<cmd>BCommits<cr>", desc = "FZF Git Buffer Commits" },
    },
  },
}

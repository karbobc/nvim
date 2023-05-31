return {
  "mbbill/undotree",
  lazy = true,
  event = "VeryLazy",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle" },
  },
  config = function()
    local undodir
    local path = "undodir"
    local has = vim.fn.has
    if has("win32") == 1 or has("win64") == 1 then
      undodir = string.format("%s\\%s", vim.env.TEMP, path)
    else
      undodir = string.format("/tmp/%s", path)
    end
    if has("persistent_undo") == 1 then
      vim.fn.mkdir(undodir, "p", "0o700")
      vim.opt["undodir"] = undodir
      vim.opt["undofile"] = true
    end
    vim.g.undotree_DiffAutoOpen = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_DiffpanelHeight = 10
    vim.g.undotree_SplitWidth = 24
  end,
}

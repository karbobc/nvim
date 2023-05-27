return {
  "mbbill/undotree",
  lazy = true,
  event = "VeryLazy",
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
      vim.fn.mkdir(undodir, "p")
      vim.opt["undodir"] = undodir
      vim.opt["undofile"] = true
    end
  end,
}

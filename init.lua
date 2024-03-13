
if vim.g.vscode then
  require("init-vscode").setup()
else
  require("init").setup()
end


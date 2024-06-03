-- default options
local options = {
  noremap = true,
  silent = true,
}

local _M = {}
local vscode = require("vscode")

-- normal mode map
_M.n = {
  { "<leader>w", "<cmd>q!<cr>",      options },
  { "<tab>",     "<cmd>tabnext<cr>", options },
  { "<s-tab>",   "<cmd>tabprev<cr>", options },
  {
    "gk",
    function()
      vscode.action("workbench.action.navigateBack")
    end,
    options
  },
  {
    "gj",
    function()
      vscode.action("workbench.action.navigateForward")
    end,
    options
  },
  {
    "ge",
    function()
      vscode.action("editor.action.marker.nextInFiles")
    end,
    options
  },
  {
    "<leader>rn",
    function()
      vscode.action("editor.action.rename")
    end,
    options
  },
}

-- insert mode map
_M.i = {}

-- visual mode map
_M.x = {
  -- formatting
  { "=", "gq", options }
}

return _M

-- default options
local options = {
  noremap = true,
  silent = true,
}

local _M = {}
local vscode = require("vscode")

-- normal mode map
_M.n = {
  -- tab management
  { "<leader>w", ":Tabclose<cr>",  options },
  { "<tab>",     ":Tabnext<cr>",   options },
  { "<s-tab>",   ":Tabprev<cr>",   options },

  -- copy to system clipboard
  { "<leader>y", ":let @+=@0<cr>", options },

  -- motion
  {
    "gd",
    function()
      vscode.action("editor.action.goToDeclaration")
    end,
    options
  },
  {
    "gi",
    function()
      vscode.action("editor.action.goToImplementation")
    end,
    options
  },
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
    "gh",
    function()
      vscode.action("editor.action.showHover")
    end,
    options
  },
  {
    "g[",
    function()
      vscode.action("workbench.action.editor.nextChange")
    end,
    options
  },
  {
    "g]",
    function()
      vscode.action("workbench.action.editor.previousChange")
    end,
    options
  },

  -- code action
  {
    "<leader>ca",
    function()
      vscode.action("editor.action.quickFix")
    end,
    options
  },

  -- rename
  {
    "<leader>rn",
    function()
      vscode.action("editor.action.rename")
    end,
    options
  },

  -- searching
  {
    "<leader>fl",
    function()
      vscode.action("workbench.action.findInFiles")
      vscode.action("vscode-neovim.escape")
    end,
    options
  },
  {
    "<leader>fa",
    function()
      vscode.action("workbench.action.quickOpen")
    end,
    options
  },
  {
    "<leader>ff",
    function()
      vscode.action("workbench.action.openRecent")
    end,
    options
  },

  -- explorer
  {
    "<leader>fe",
    function()
      vscode.action("workbench.view.explorer")
    end,
    options
  },
  {
    "<leader>`",
    function()
      vscode.action("workbench.files.action.showActiveFileInExplorer")
    end,
    options
  },
}

-- insert mode map
_M.i = {}

-- visual mode map
_M.x = {
  -- code indent
  { "<", "<gv", options },
  { ">", ">gv", options },

  -- formatting
  {
    "=",
    function()
      vscode.call("editor.action.formatSelection")
      vscode.call("vscode-neovim.escape")
    end,
    options
  },

  -- rename
  {
    "<leader>rn",
    function()
      vscode.action("editor.action.rename")
    end,
    options
  },

  -- searching
  {
    "<leader>fl",
    function()
      vscode.action("workbench.action.findInFiles", { args = { query = vim.fn.expand("<cword>") } })
      vscode.action("vscode-neovim.escape")
    end,
    options
  },
  {
    "<leader>fa",
    function()
      vscode.action("workbench.action.quickOpen")
    end,
    options
  },
  {
    "<leader>ff",
    function()
      vscode.action("workbench.action.openRecent")
    end,
    options
  },
}

return _M

-- default options
local options = {
  noremap = true,
  silent = true,
}

local _M = {}

-- normal mode map
_M.n = {
  -- yank
  {
    "<leader>y",
    function()
      vim.cmd("let @+ = @0")
      vim.notify("Copied to the system clipboard.")
    end,
    options
  },
  -- forward
  { "gj", "<C-i>", options },
  -- backward
  { "gk", "<C-o>", options },
}

-- insert mode map
_M.i = {}

-- visual mode map
_M.x = {
  -- formatting
  { "=", "gq", options },
  -- code indent
  { "<", "<gv", options },
  { ">", ">gv", options },
}

return _M

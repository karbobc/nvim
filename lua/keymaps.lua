-- default options
local options = {
  noremap = true,
  silent = true,
}

local _M = {}

-- normal mode map
_M.n = {
  -- coc.nvim
  { "gd", "<Plug>(coc-definition)", options },
  { "gy", "<Plug>(coc-type-definition)", options },
  { "gi", "<Plug>(coc-implementation)", options },
  { "gr", "<Plug>(coc-references)", options },
  { "<leader>rn", "<Plug>(coc-rename)", options },
  { "<leader>cf", "<Plug>(coc-format-selected)", options },
  { "<leader>cdn", "<Plug>(coc-diagnostic-next)", options },
  { "<leader>cdp", "<Plug>(coc-diagnostic-prev)", options },
  { "<leader>ca", "<Plug>(coc-codeaction-selected)", options },
}

-- insert mode map
_M.i = {}


-- visual mode map
_M.x = {
  -- coc.nvim
  { "<leader>cf", "<Plug>(coc-format-selected)", options },
  { "<leader>ca", "<Plug>(coc-codeaction-selected)", options },
  { "if", "<Plug>(coc-funcobj-i)", options },
  { "af", "<Plug>(coc-funcobj-a)", options },
  { "ic", "<Plug>(coc-classobj-i)", options },
  { "ac", "<Plug>(coc-classobj-a)", options },
  { "<leader>y", "<Plug>OSCYankVisual", options }
}

return _M

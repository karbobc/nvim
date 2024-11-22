
local _M = {}

_M.setup = function()
  -- highlight yank
  vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
      vim.highlight.on_yank({
        higroup = "Search",
        timeout = 300,
      })
    end,
  })
end

return _M


return {
  "rcarriga/nvim-notify",
  lazy = true,
  event = "VeryLazy",
  opts = {
    background_colour = "#000000",
    timeout = 3000,
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    render = "default",
    stages = "fade_in_slide_out",
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        vim.notify = require("notify")
      end,
    })
  end,
}

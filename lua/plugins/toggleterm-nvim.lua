return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = true,
  keys = {
    { "<m-q>", "<cmd>ToggleTerm<cr>", mode = { "n", "i", "t" }, desc = "Toggle Terminal" },
  },
  opts = {
    open_mapping = nil,
    on_open = function()
      local options = {
        noremap = true,
        silent = true,
        nowait = true,
        buffer = 0,
      }
      vim.keymap.set("t", "<Esc>", "<cmd>ToggleTerm<cr>", options)
    end,
    -- hide the number column in toggleterm buffers
    hide_nubmer = true,
    -- highlights
    highlights = {},
    -- NOTE: this option takes priority over highlights specified,
    -- so if you specify Normal highlights you should set this to false
    shade_terminals = false,
    -- enter insert mode when start terminal
    start_in_insert = true,
    -- whether or not the open mapping applies in insert mode
    insert_mappings = true,
    -- whether or not the open mapping applies in the opened terminals
    terminal_mappings = true,
    -- 'vertical' | 'horizontal' | 'tab' | 'float'
    direction = "float",
    -- close the terminal window when the process exits
    close_on_exit = true,
    -- change the default shell
    shell = vim.o.shell,
    -- automatically scroll to the bottom on terminal output
    auto_scroll = true,
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      border = "curved",
      -- transparency of ternimal
      winblend = 0,
    },
  },
  config = function(_, opts)
    local plugin = require("toggleterm")
    plugin.setup(opts)
  end,
}

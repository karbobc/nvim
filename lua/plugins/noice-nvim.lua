return {
  "folke/noice.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    -- `nvim-notify` is only needed, if you want to use the notification view.
    -- If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  keys = {
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      -- use a classic bottom cmdline for search
      bottom_search = false,
      -- position the cmdline and popupmenu together
      command_palette = true,
      -- long messages will be sent to a split
      long_message_to_split = true,
      -- enables an input dialog for inc-rename.nvim
      inc_rename = true,
    },
  },
  config = function(_, opts)
    vim.opt.lazyredraw = false
    local plugin = require("noice")
    plugin.setup(opts)
  end,
}

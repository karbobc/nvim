return {
  "smjonas/inc-rename.nvim",
  lazy = true,
  keys = {
    {
      "<leader>rn",
      function()
        local inc_rename = require("inc_rename")
        return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "IncRename"
    },
  },
  opts = {
    -- the name of the command
    cmd_name = "IncRename",
    -- the highlight group used for highlighting the identifier's new name
    hl_group = "Substitute",
    -- whether an empty new name should be previewed;
    -- if false the command preview will be cancelled instead
    preview_empty_name = false,
    -- whether to display a `Renamed m instances in n files` message after a rename operation
    show_message = true,
    -- the type of the external input buffer to use (the only supported value is currently "dressing")
    input_buffer_type = nil,
    -- callback to run after renaming, receives the result table (from LSP handler) as an argument
    post_hook = nil,
  },
  config = function(_, opts)
    local plugin = require("inc_rename")
    plugin.setup(opts)
  end,
}

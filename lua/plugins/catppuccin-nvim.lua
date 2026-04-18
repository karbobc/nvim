return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = true,
  event = "VimEnter",
  priority = 1000,
  opts = {
    flavour = "mocha",
    default_integrations = false,
    integrations = {
      alpha = true,
      cmp = true,
      flash = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        scope_color = "",
        colored_indent_levels = false,
      },
      lualine = {
        all = function(colors)
          return {
            normal = {
              a = { bg = colors.lavender, gui = "italic" },
              b = { fg = colors.lavender },
            }
          }
        end,
      },
      mason = true,
      noice = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      notify = true,
      nvimtree = true,
      nvim_surround = true,
      rainbow_delimiters = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    local plugin = require("catppuccin")
    plugin.setup(opts)
    vim.cmd.colorscheme("catppuccin-nvim")
  end,
}

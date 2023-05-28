return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  ---@type TSconfig
  opts = {
    -- A list of parser names, or "all"
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "cmake",
      "comment",
      "dot",
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "lua",
      "luadoc",
      "json",
      "make",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "sql",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing (for "all")
    ignore_install = {},
    highlight = {
      enable = true,
      -- list of language that will be disabled
      -- NOTE: these are the names of the parsers and not the filetype.
      disable = {},
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    local plugin = require("nvim-treesitter.configs")
    plugin.setup(opts)
  end,
}

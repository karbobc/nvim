return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    ---@type TSconfig
    opts = {
      -- A list of parser names, or "all"
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "comment",
        "dockerfile",
        "go",
        "gomod",
        "gosum",
        "lua",
        "luadoc",
        "json",
        "jsonc",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "sql",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      textobjects = {
        select = {
          enable = true,
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace.
          include_surrounding_whitespace = true,
        },
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
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function(_, opts)
      local plugin = require("treesitter-context")
      plugin.setup(opts)
    end
  },
}

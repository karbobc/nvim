return {
  fileencoding   = "utf-8",
  termencoding   = "utf-8",
  encoding       = "utf-8",
  tabstop        = 2,
  shiftwidth     = 2,
  softtabstop    = 2,
  expandtab      = true,
  smarttab       = true,
  incsearch      = true,
  autoindent     = true,
  smartindent    = true,
  number         = true,
  relativenumber = true,
  cursorline     = true,
  termguicolors  = true,
  ignorecase     = true,
  wrap           = false,
  wildmenu       = true,
  wildignore     = "*.o,*.pyc,*.swp",
  backspace      = "indent,eol,start",
  foldenable     = false,
  foldmethod     = "indent",
  foldlevel      = 999,
  mouse          = "a",
  hlsearch       = false,
  scrolloff      = 5,
  sidescrolloff  = 10,
  hidden         = true,
  autochdir      = true,
  timeoutlen     = 500,
  background     = "dark",
  splitright     = true,
  splitbelow     = true,
  list           = true,
  listchars      = "tab:➜ ",
  lazyredraw     = true,
  visualbell     = true,

  ["g"] = {
    mapleader = " ",
    -- coc.nvim
    ["coc_global_extensions"] = {
      "coc-json",
      "coc-yaml",
      "coc-sh",
      "coc-clangd",
      "coc-sumneko-lua",
      "coc-docker",
      "coc-pyright",
      "coc-markdownlint",
    },
    -- editorconfig-vim
    ["EditorConfig_exclude_patterns"] = {
      "fugitive://.*",
      "scp://.*",
    },
    -- vim-illuminate
    Illuminate_delay = 500,
    -- undotree
    undotree_DiffAutoOpen = 1,
    undotree_SetFocusWhenToggle = 1,
    undotree_ShortIndicators = 1,
    undotree_WindowLayout = 2,
    undotree_DiffpanelHeight = 10,
    undotree_SplitWidth = 24,
  },

}

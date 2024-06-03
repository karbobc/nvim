return {
  ignorecase     = true,
  incsearch      = true,
  hlsearch       = true,
  scrolloff      = 10,
  sidescrolloff  = 10,
  timeoutlen     = 500,
  splitright     = true,
  splitbelow     = true,

  ["g"] = {
    mapleader      = " ",
    maplocalleader = " ",
    clipboard      = vim.g.vscode_clipboard,
  },
}

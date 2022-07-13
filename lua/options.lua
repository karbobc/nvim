return {
    fileencoding   = "utf-8",
    termencoding   = "utf-8",
    encoding       = "utf-8",
    tabstop        = 4,
    shiftwidth     = 4,
    softtabstop    = 4,
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
    wildignore     = "*.o,*.pyc",
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
    },

}

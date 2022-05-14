
-- use vim-plug to manage the plugins
local plugins = {
    -- vim-airline
    "vim-airline/vim-airline",

    -- vim-airline-themes
    "vim-airline/vim-airline-themes",

    -- auto-pairs
    "jiangmiao/auto-pairs",

    -- vim-color-solarized
    "altercation/vim-colors-solarized",

    -- vim-fugitive
    "tpope/vim-fugitive",

    -- syntastic
    "scrooloose/syntastic",

    -- vim-auto-save
    "907th/vim-auto-save",

    -- vim-easy-align
    "junegunn/vim-easy-align", 

    -- vim-surround
    "tpope/vim-surround",

    -- vim-commentary
    "tpope/vim-commentary",

    -- fzf.vim
    "~/.fzf",
    "junegunn/fzf.vim",

    -- vim-visual-multi
    ["mg979/vim-visual-multi"] = {
        branch = "master",
    },

    -- coc.nvim
    ["neoclide/coc.nvim"] = {
        branch = "release",
    },

}

-- vim-plug
local plug = vim.fn["plug#"]

local function extra(name, table)
    for k, v in pairs(table) do
        plug(name, { k = v })
    end
end

local function main()
    -- plug("begin")
    vim.call("plug#begin")
    for k, v in pairs(plugins) do
        if (type(k) == "number") then
            plug(v)
        else
            extra(k, v)
        end
    end
    -- plug("end")
    vim.call("plug#end")
end

main()

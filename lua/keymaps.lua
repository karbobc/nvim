
-- default options
local options = {
    noremap = true,
    silent = true,
}

local _M = {}

-- normal mode map
_M.n = {
    -- vim-easy-align
    { "<leader>ga", "<Plug>(EasyAlign)" },
    -- fzf
    { "<leader>ff", "<cmd>Files<cr>", options },
    { "<leader>fl", "<cmd>Lines<cr>", options },
    { "<leader>fbl", "<cmd>BLines<cr>", options },
    { "<leader>ft", "<cmd>Tags<cr>", options },
    { "<leader>fbt", "<cmd>BTags<cr>", options },
    { "<leader>fh", "<cmd>History<cr>", options },
    -- vim-oscyank
    { "<leader>y", "<cmd>OSCYank<cr>", options },
}

-- insert mode map
_M.i = {

}

-- visual mode map
_M.x = {
    -- vim-easy-align
    { "<leader>ga", "<Plug>(EasyAlign)" },
}

return _M


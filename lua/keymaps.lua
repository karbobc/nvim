
-- default options
local options = {
    noremap = true,
    silent = true,
}

local _M = {}

-- normal mode map
_M.n = {
    -- bufferline
    { "<tab>", "<cmd>BufferLineCycleNext<cr>", options },
    { "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", options },
    { "<leader>w", "<cmd>bdelete<cr>", options },
    -- vim-easy-align
    { "<leader>ga", "<Plug>(EasyAlign)" },
    -- fzf
    { "<leader>ff", "<cmd>Files<cr>", options },
    { "<leader>fl", "<cmd>Lines<cr>", options },
    { "<leader>fbl", "<cmd>BLines<cr>", options },
    { "<leader>ft", "<cmd>Tags<cr>", options },
    { "<leader>fbt", "<cmd>BTags<cr>", options },
    { "<leader>fh", "<cmd>History<cr>", options },
    { "<leader>fm", "<cmd>Marks<cr>", options },
    { "<leader>fgf", "<cmd>GFiles<cr>", options },
    { "<leader>fgs", "<cmd>GFiles?<cr>", options },
    { "<leader>fgc", "<cmd>Commits<cr>", options },
    { "<leader>fgbc", "<cmd>BCommits<cr>", options },
    -- vim-oscyank
    { "<leader>y", "<cmd>OSCYank<cr>", options },
    -- navigator
    { "<c-h>", "<cmd>NavigatorLeft<cr>", options },
    { "<c-l>", "<cmd>NavigatorRight<cr>", options },
    { "<c-k>", "<cmd>NavigatorUp<cr>", options },
    { "<c-j>", "<cmd>NavigatorDown<cr>", options },
    -- vim-gitgutter
    { "<leader>gg", "<cmd>GitGutterToggle<cr>", options },
    { "<leader>gb", "<cmd>GitGutterBufferToggle<cr>", options },
    { "<leader>gs", "<cmd>GitGutterSignsToggle<cr>", options },
    { "<leader>glh", "<cmd>GitGutterLineHighlightsToggle<cr>", options },
    { "<leader>ghn", "<Plug>(GitGutterNextHunk)", options },
    { "<leader>ghp", "<Plug>(GitGutterPrevHunk)", options },
    { "<leader>ghs", "<Plug>(GitGutterStageHunk)", options },
    { "<leader>ghu", "<Plug>(GitGutterUndoHunk)", options },
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


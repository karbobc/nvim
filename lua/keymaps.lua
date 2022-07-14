
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
    { "<leader>ea", "<Plug>(EasyAlign)" },
    -- fzf
    { "<leader>ff", "<cmd>Files<cr>", options },
    { "<leader>fl", "<cmd>Lines<cr>", options },
    { "<leader>fbl", "<cmd>BLines<cr>", options },
    { "<leader>ft", "<cmd>Tags<cr>", options },
    { "<leader>fbt", "<cmd>BTags<cr>", options },
    { "<leader>fh", "<cmd>History<cr>", options },
    { "<leader>fmk", "<cmd>Marks<cr>", options },
    { "<leader>fmp", "<cmd>Maps<cr>", options },
    { "<leader>fgf", "<cmd>GFiles<cr>", options },
    { "<leader>fgs", "<cmd>GFiles?<cr>", options },
    { "<leader>fgc", "<cmd>Commits<cr>", options },
    { "<leader>fgbc", "<cmd>BCommits<cr>", options },
    -- coc.nvim
    { "gd", "<Plug>(coc-definition)", options },
    { "gy", "<Plug>(coc-type-definition)", options },
    { "gi", "<Plug>(coc-implementation)", options },
    { "gr", "<Plug>(coc-references)", options },
    { "<leader>rn", "<Plug>(coc-rename)", options },
    { "<leader>cf", "<Plug>(coc-format-selected)", options },
    { "<leader>cdn", "<Plug>(coc-diagnostic-next)", options },
    { "<leader>cdp", "<Plug>(coc-diagnostic-prev)", options },
    { "<leader>ca", "<Plug>(coc-codeaction-selected)", options },
    -- vim-oscyank
    { "<leader>y", "<cmd>OSCYank<cr>", options },
    -- navigator
    { "<c-h>", "<cmd>NavigatorLeft<cr>", options },
    { "<c-l>", "<cmd>NavigatorRight<cr>", options },
    { "<c-k>", "<cmd>NavigatorUp<cr>", options },
    { "<c-j>", "<cmd>NavigatorDown<cr>", options },
    -- vim-gitgutter
    { "<leader>gg", "<cmd>GitGutterToggle<cr>", options },
    { "<leader>gbb", "<cmd>GitGutterBufferToggle<cr>", options },
    { "<leader>gss", "<cmd>GitGutterSignsToggle<cr>", options },
    { "<leader>glh", "<cmd>GitGutterLineHighlightsToggle<cr>", options },
    { "<leader>ghn", "<Plug>(GitGutterNextHunk)", options },
    { "<leader>ghp", "<Plug>(GitGutterPrevHunk)", options },
    { "<leader>ghs", "<Plug>(GitGutterStageHunk)", options },
    { "<leader>ghu", "<Plug>(GitGutterUndoHunk)", options },
    -- hop.nvim
    { "<leader>hc1", "<cmd>HopChar1<cr>", options },
    { "<leader>hc2", "<cmd>HopChar2<cr>", options },
    { "<leader>hl", "<cmd>HopLine<cr>", options },
    { "<leader>hv", "<cmd>HopVertical<cr>", options },
    { "<leader>hw", "<cmd>HopWord<cr>", options },
    { "<leader>hp", "<cmd>HopPattern<cr>", options },
    -- nvim-tree
    { "<leader>fe", "<cmd>NvimTreeToggle<cr>", options },
}

-- insert mode map
_M.i = {

}

-- visual mode map
_M.x = {
    -- vim-easy-align
    { "<leader>ea", "<Plug>(EasyAlign)" },
    -- coc.nvim
    { "<leader>cf", "<Plug>(coc-format-selected)", options },
    { "<leader>ca", "<Plug>(coc-codeaction-selected)", options },
    { "if", "<Plug>(coc-funcobj-i)", options },
    { "af", "<Plug>(coc-funcobj-a)", options },
    { "ic", "<Plug>(coc-classobj-i)", options },
    { "ac", "<Plug>(coc-classobj-a)", options },
}

return _M



-- package
local plugins = require("plugins")
local stdpath = vim.fn.stdpath
local log = vim.notify

-- config table
local config = {}


-- ===== options config =====
config.options = function()
    for k, v in pairs(require("options")) do
        if k == "g" then
            for i, j in pairs(v) do
                vim.g[i] = j
            end
        else
            vim.opt[k] = v
        end
    end
end


-- ===== packer plugings ======
config.packer = function()
    -- use vim-plug manage the plugins
    local plug = vim.fn["plug#"]
    -- vim-plug begin
    vim.call("plug#begin", stdpath("data") .. "/plugged")
    for k1, v1 in pairs(plugins) do
        if (type(v1) == "table") then
            -- k1: plug name
            -- v1: options
            plug(k1, v1)
        else
            -- k1: index
            -- v1: plug name
            plug(v1)
        end
    end
    -- vim-plug end
    vim.call("plug#end")
end


-- ===== plugins config =====
-- lualine
config.lualine = function()
    local ok, plugin = pcall(require, "lualine")
    if not ok then
        log("lualine not found")
        return
    end
    plugin.setup({
        options = {
            icons_enabled = true,
            theme = "vscode",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = false,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "%l/%L" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    })
end

-- bufferline
config.bufferline = function()
    local ok, plugin = pcall(require, "bufferline")
    if not ok then
        log("bufferline not found")
        return
    end
    plugin.setup({
        options = {
            buffer_close_icon = "",
            close_command = "Bdelete %d",
            close_icon = "",
            indicator_icon = " ",
            left_trunc_marker = "",
            modified_icon = "●",
            offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center"  }  },
            right_mouse_command = "Bdelete! %d",
            right_trunc_marker = "",
            show_close_icon = false,
            show_tab_indicators = true,
        },
        highlights = {
            fill = {
                guifg = { attribute = "fg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "StatusLineNC"  },
            },
            background = {
                guifg = { attribute = "fg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "StatusLine"  },
            },
            buffer_visible = {
                guifg = { attribute = "fg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "Normal"  },
            },
            buffer_selected = {
                guifg = { attribute = "fg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "Normal"  },
            },
            separator = {
                guifg = { attribute = "bg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "StatusLine"  },
            },
            separator_selected = {
                guifg = { attribute = "fg", highlight = "Special"  },
                guibg = { attribute = "bg", highlight = "Normal"  },
            },
            separator_visible = {
                guifg = { attribute = "fg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "StatusLineNC"  },
            },
            close_button = {
                guifg = { attribute = "fg", highlight = "Normal"  },
                guibg = { attribute = "bg", highlight = "StatusLine"  },
            },
            close_button_selected = {
                guifg = { attribute = "fg", highlight = "normal"  },
                guibg = { attribute = "bg", highlight = "normal"  },
            },
            close_button_visible = {
                guifg = { attribute = "fg", highlight = "normal"  },
                guibg = { attribute = "bg", highlight = "normal"  },
            },
        }
    })
end

-- vscode
config.vscode = function()
    local ok, _ = pcall(require, "vscode")
    if not ok then
        log("vscode not found")
        return
    end
    vim.g.vscode_style = "dark"
    vim.g.vscode_transparent = 1
    vim.g.vscode_italic_comment = 1
    vim.g.vscode_disable_nvimtree_bg = true
    vim.cmd("colorscheme vscode")
end

-- autopairs
config.autopairs = function()
    local ok, plugin = pcall(require, "nvim-autopairs")
    if not ok then
        log("autopairs not found")
        return
    end
    plugin.setup({})
end

-- autosave
config.autosave = function()
    local ok, plugin = pcall(require, "autosave")
    if not ok then
        log("autosave not found")
        return
    end
    plugin.setup({
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = { "InsertLeave", "TextChanged" },
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    })
end

-- Comment
config.comment = function()
    local ok, plugin = pcall(require, "Comment")
    if not ok then
        log("Comment not found")
        return
    end
    plugin.setup({})
end

-- fzf
config.fzf = function()
    local options = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Files<cr>", options)
    vim.api.nvim_set_keymap("n", "<leader>fl", "<cmd>Lines<cr>", options)
    vim.api.nvim_set_keymap("n", "<leader>fbl", "<cmd>BLines<cr>", options)
    vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Tags<cr>", options)
    vim.api.nvim_set_keymap("n", "<leader>fbt", "<cmd>BTags<cr>", options)
    vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>History<cr>", options)
end

-- nvim-treesitter
config.treesitter = function()
    local ok, plugin = pcall(require, "nvim-treesitter.configs")
    if not ok then
        log("treesitter not found")
        return
    end
    plugin.setup({
        -- A list of parser names, or "all"
        ensure_installed = {
            "c",
            "lua",
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
        }
    })
end


-- ===== startup =====
config.setup = function()
    config.packer()
    for name, func in pairs(config) do
        if name ~= "setup" and name ~= "pakcer" then
            func()
        end
    end
end

return config

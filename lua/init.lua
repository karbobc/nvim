
-- init value
local plugins = require("plugins")
local stdpath = vim.fn.stdpath
local log = vim.notify

-- config table
local config = {}


-- ===== options config =====
config.options = function()
    local opt = vim.opt
    for k, v in pairs(require("options")) do
        opt[k] = v
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
-- nvim-web-devicons
config.nvim_web_devicons = function()
    local ok, plugin = pcall(require, "nvim-web-devicons")
    if not ok then
        log("nvim-web-devicons not found")
        return
    end
    plugin.setup({
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh"
            },
        },
        default = true,
    })
end

-- lualine
config.lualine = function()
    local ok, plugin = pcall(require, "lualine")
    if not ok then
        log("lualine not found")
        return
    end
    plugin.setup({
        options = {
            icons_enabled = false,
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
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" }
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
    -- Enable italic comment
    vim.g.vscode_italic_comment = 1
    -- Disable nvim-tree background color
    vim.g.vscode_disable_nvimtree_bg = true
    -- vim.g.colorscheme = "vscode"
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

-- ===== startup =====
config.startup = function()
    config.packer()
    for name, func in pairs(config) do
        if name ~= "startup" and name ~= "pakcer" then
            func()
        end
    end
end

return config

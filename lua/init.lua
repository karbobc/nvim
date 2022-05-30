
-- package
local plugins = require("plugins")
local stdpath = vim.fn.stdpath
local log = vim.notify

-- config table
local config = {}
local _M = {}


-- ===== options config ===== --
config._options = function()
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


-- ===== keymaps config ===== --
config.keymaps = function()
    for mode, keymaps in pairs(require("keymaps")) do
        for _, map in pairs(keymaps) do
            vim.keymap.set(mode, map[1], map[2], map[3] or {})
        end
    end
end


-- ===== packer plugings ====== --
config._packer = function()
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


-- ===== plugins config ===== --
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
            lualine_b = { "branch", "diff" },
            lualine_c = { "diagnostics" },
            lualine_x = { "encoding" },
            lualine_y = { "progress" },
            lualine_z = { "%l/%L" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
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
            close_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            right_mouse_command = nil,
            middle_mouse_command = nil,
            close_icon = "",
            buffer_close_icon = "",
            indicator_icon = "▎",
            modified_icon = "●",
            left_trunc_marker = "",
            right_trunc_marker = "",
            offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
            color_icons = true,
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_buffer_default_icon = true,
            show_close_icon = false,
            show_tab_indicators = true,
            separator_style = "thin",
        },
        highlights = {
            fill = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "StatusLineNC" },
            },
            background = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "StatusLine" },
            },
            buffer_visible = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "Normal" },
            },
            buffer_selected = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "Normal" },
            },
            separator = {
                guifg = { attribute = "bg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "StatusLine" },
            },
            separator_selected = {
                guifg = { attribute = "fg", highlight = "Special" },
                guibg = { attribute = "bg", highlight = "Normal" },
            },
            separator_visible = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "StatusLineNC" },
            },
            close_button = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "StatusLine" },
            },
            close_button_selected = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "Normal" },
            },
            close_button_visible = {
                guifg = { attribute = "fg", highlight = "Normal" },
                guibg = { attribute = "bg", highlight = "Normal" },
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
    vim.o.background = "dark"
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
            "json",
            "yaml",
            "bash",
            "c",
            "cpp",
            "lua",
            "dockerfile",
            "python",
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
        rainbow = {
            enable = true,
            disable = {},
            -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            extended_mode = true,
            max_file_lines = 10000,
        }
    })
end

-- Navigator
config.navigator = function()
    local ok, plugin = pcall(require, "Navigator")
    if not ok then
        log("navigator not found")
        return
    end
    plugin.setup()
end


-- ===== startup =====
_M.setup = function()
    config._packer()
    config._options()
    for name, func in pairs(config) do
        if not string.match(name, "_") then
            func()
        end
    end
end

return _M


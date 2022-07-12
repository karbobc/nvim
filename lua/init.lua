
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

-- dashboard
config.dashboard = function()
    local ok, plugin = pcall(require, "alpha")
    if not ok then
        log("alpha not found")
        return
    end
    local dashbaord = require("alpha.themes.dashboard")
    dashbaord.section.buttons.val = {
        dashbaord.button("e", "📄 New File", "<cmd>ene<cr>"),
        dashbaord.button("SPC f f", "🧐 Find Files", "<cmd>Files<cr>"),
        dashbaord.button("SPC f h", "🕣 Open Recent", "<cmd>History<cr>"),
        dashbaord.button("SPC f m", "📑 Find Bookmarks", "<cmd>Marks<cr>"),
        dashbaord.button("q", "💤 Quit Nvim", "<cmd>qa<cr>"),
    }
    plugin.setup(dashbaord.config)
end

-- bookmarks
config.bookmarks = function ()
    local ok, plugin = pcall(require, "marks")
    if not ok then
        log("bookmakrs not found")
        return
    end
    plugin.setup({
        -- whether to map keybinds or not. default true
        default_mappings = false,
        -- which builtin marks to show. default {}
        -- builtin_marks = { ".", "<", ">", "^" },
        builtin_marks = { "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = true,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_1 = {
            sign = "⚑",
            virt_text = "⛳️ Bookmark ⛳️",
        },
        mappings = {
            toggle           = "mm",
            next             = "m[",
            prev             = "m]",
            delete           = "dm",
            set_bookmark1    = "m1",
            delete_bookmark  = "dm1",
            delete_bookmark1 = "dm<space>",
            next_bookmark1   = "mn",
            prev_bookmark1   = "mp",
        }
    })
end

-- indent-blankline
config.indentline = function()
    local ok, plugin = pcall(require, "indent_blankline")
    if not ok then
        log("indent-blankline not found")
        return
    end
    plugin.setup({
        -- highlight blankline in current context
        show_current_context = true,
    })
end

-- toggleterm.nvim
config.toggleterm = function()
    local ok, plugin = pcall(require, "toggleterm")
    if not ok then
        log("toggleterm not found")
        return
    end
    plugin.setup({
        open_mapping = "<m-q>",
        on_open = function()
            local options = {
                noremap = true,
                silent = true,
                nowait = true,
                buffer = 0,
            }
            vim.keymap.set("t", "<Esc>", "<cmd>ToggleTerm<cr>", options)
        end,
        -- hide the number column in toggleterm buffers
        hide_nubmer = true,
        -- highlights
        highlights = {},
        -- NOTE: this option takes priority over highlights specified,
        -- so if you specify Normal highlights you should set this to false
        shade_terminals = false,
        -- enter insert mode when start terminal
        start_in_insert = true,
        -- whether or not the open mapping applies in insert mode
        insert_mappings = true,
        -- whether or not the open mapping applies in the opened terminals
        terminal_mappings = true,
        -- 'vertical' | 'horizontal' | 'tab' | 'float'
        direction = "float",
        -- close the terminal window when the process exits
        close_on_exit = true,
        -- change the default shell
        shell = vim.o.shell,
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            -- The border key is *almost* the same as 'nvim_open_win'
            -- see :h nvim_open_win for details on borders however
            -- the 'curved' border is a custom border type
            -- not natively supported but implemented in this plugin.
            -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            border = "curved",
        }
    })
end

-- which-key
config.whichkey = function()
    local ok, plugin = pcall(require, "which-key")
    if not ok then
        log("which-key not found")
        return
    end
    plugin.setup({
        plugins = {
            -- shows a list of your marks on ' and `
            marks = true,
            -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            registers = true,
            spelling = {
                -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                enabled = true,
                -- how many suggestions should be shown in the list?
                suggestions = 20,
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                -- adds help for operators like d, y, ... and registers them for motion / text object completion
                operators = true,
                -- adds help for motions
                motions = true,
                -- help for text objects triggered after entering an operator
                text_objects = true,
                -- default bindings on <c-w>
                windows = true,
                -- misc bindings to work with windows
                nav = true,
                -- bindings for folds, spelling and others prefixed with z
                z = true,
                -- bindings for prefixed with g
                g = true,
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
            -- override the label used to display some keys. It doesn't effect WK in any other way.
            -- For example:
            -- ["<space>"] = "SPC",
            -- ["<cr>"] = "RET",
            -- ["<tab>"] = "TAB",
        },
        icons = {
            -- symbol used in the command line area that shows your active key combo
            breadcrumb = "»",
            -- symbol used between a key and it's label
            separator = "➜",
            -- symbol prepended to a group
            group = "+",
        },
        popup_mappings = {
            -- binding to scroll down inside the popup
            scroll_down = "<c-d>",
            -- binding to scroll up inside the popup
            scroll_up = "<c-u>",
        },
        window = {
            -- none, single, double, shadow
            border = "none",
            -- bottom, top
            position = "bottom",
            -- extra window margin [top, right, bottom, left]
            margin = { 1, 0, 1, 0 },
            -- extra window padding [top, right, bottom, left]
            padding = { 2, 2, 2, 2 },
            winblend = 0
        },
        layout = {
            -- min and max height of the columns
            height = { min = 4, max = 10 },
            -- min and max width of the columns
            width = { min = 20, max = 50 },
            -- spacing between columns
            spacing = 3,
            -- align columns left, center or right
            align = "left",
        },
        -- enable this to hide mappings for which you didn't specify a label
        ignore_missing = false,
        -- hide mapping boilerplate
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
        -- show help message on the command line when the popup is visible
        show_help = true,
        -- automatically setup triggers
        triggers = "auto",
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "j", "k" },
            v = { "j", "k" },
        },
    })
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


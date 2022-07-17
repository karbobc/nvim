
-- package
local plugins = require("plugins")
local stdpath = vim.fn.stdpath

-- config table
local config = {}
local _M = {}

-- ===== utils ===== --
--- log message using `nvim-notify` if exists
--- @param msg string message
--- @param level? number log level
local log = function(msg, level)
  local ok, notify = pcall(require, "notify")
  if not ok then
    vim.notify(msg, level)
    return
  end
  local ok, async = pcall(require, "plenary.async")
  if not ok then
    notify(msg, level)
    return
  end
  async.run(function()
    notify.async(msg, level)
  end)
end


-- ===== options config ===== --
table.insert(config, function()
  for k, v in pairs(require("options")) do
    if k == "g" then
      for i, j in pairs(v) do
        vim.g[i] = j
      end
    else
      vim.opt[k] = v
    end
  end
end)


-- ===== keymaps config ===== --
table.insert(config, function()
  for mode, keymaps in pairs(require("keymaps")) do
    for _, map in pairs(keymaps) do
      vim.keymap.set(mode, map[1], map[2], map[3] or {})
    end
  end
end)


-- ===== packer plugings ====== --
table.insert(config, function()
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
end)


-- ===== plugins config ===== --
-- notify
table.insert(config, function()
  local ok, plugin = pcall(require, "notify")
  if not ok then
    log("notify not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({
    background_colour = "#000000",
    fps = 60,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = vim.log.levels.INFO,
    timeout = 3000,
    minimum_width = 50,
    render = "default",
    stages = "fade_in_slide_out",
  })
end)

-- vscode
table.insert(config, function()
  local ok, plugin = pcall(require, "vscode")
  if not ok then
    log("vscode not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({
    -- Enable transparent background
    transparent = true,
    -- Enable italic comment
    italic_comments = true,
    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {},
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {},
  })
end)

-- lualine
table.insert(config, function()
  local ok, plugin = pcall(require, "lualine")
  if not ok then
    log("lualine not found", vim.log.levels.WARN)
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
    extensions = {
      "man",
      "fzf",
      "fugitive",
      "nvim-tree",
      "toggleterm",
    },
  })
end)

-- bufferline
table.insert(config, function()
  local ok, plugin = pcall(require, "bufferline")
  if not ok then
    log("bufferline not found", vim.log.levels.WARN)
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
      offsets = {
        { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
        { filetype = "undotree", text = "Undo Tree", text_align = "center" },
      },
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
end)

-- autopairs
table.insert(config, function()
  local ok, plugin = pcall(require, "nvim-autopairs")
  if not ok then
    log("autopairs not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({})
end)

-- autosave
table.insert(config, function()
  local ok, plugin = pcall(require, "autosave")
  if not ok then
    log("autosave not found", vim.log.levels.WARN)
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
end)

-- Comment
table.insert(config, function()
  local ok, plugin = pcall(require, "Comment")
  if not ok then
    log("Comment not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({})
end)

-- nvim-treesitter
table.insert(config, function()
  local ok, plugin = pcall(require, "nvim-treesitter.configs")
  if not ok then
    log("treesitter not found", vim.log.levels.WARN)
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
end)

-- Navigator
table.insert(config, function()
  local ok, plugin = pcall(require, "Navigator")
  if not ok then
    log("navigator not found", vim.log.levels.WARN)
    return
  end
  plugin.setup()
end)

-- dashboard
table.insert(config, function()
  local ok, plugin = pcall(require, "alpha")
  if not ok then
    log("alpha not found", vim.log.levels.WARN)
    return
  end
  local dashboard = require("alpha.themes.dashboard")
  dashboard.section.buttons.val = {
    dashboard.button("e", "📄 New File", "<cmd>ene<cr>"),
    dashboard.button("SPC f f", "🧐 Find Files", "<cmd>Files<cr>"),
    dashboard.button("SPC f h", "🕣 Open Recent", "<cmd>History<cr>"),
    dashboard.button("SPC f m", "📑 Find Bookmarks", "<cmd>Marks<cr>"),
    dashboard.button("q", "💤 Quit Nvim", "<cmd>qa<cr>"),
  }
  plugin.setup(dashboard.config)
end)

-- bookmarks
table.insert(config, function()
  local ok, plugin = pcall(require, "marks")
  if not ok then
    log("bookmakrs not found", vim.log.levels.WARN)
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
end)

-- indent-blankline
table.insert(config, function()
  local ok, plugin = pcall(require, "indent_blankline")
  if not ok then
    log("indent-blankline not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({
    -- highlight blankline in current context
    show_current_context = true,
  })
end)

-- toggleterm.nvim
table.insert(config, function()
  local ok, plugin = pcall(require, "toggleterm")
  if not ok then
    log("toggleterm not found", vim.log.levels.WARN)
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
      -- transparency of ternimal
      winblend = 0,
    }
  })
end)

-- which-key
table.insert(config, function()
  local ok, plugin = pcall(require, "which-key")
  if not ok then
    log("which-key not found", vim.log.levels.WARN)
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
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
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
end)

-- hop.nvim
table.insert(config, function()
  local ok, plugin = pcall(require, "hop")
  if not ok then
    log("hop not found", vim.log.levels.WARN)
    return
  end
  plugin.setup()
end)

-- neoscroll.nvim
table.insert(config, function()
  local ok, plugin = pcall(require, "neoscroll")
  if not ok then
    log("neoscroll not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {
      "<C-u>", "<C-d>",
      "<C-b>", "<C-f>",
      "zt", "zz", "zb",
    },
    -- Hide cursor while scrolling
    hide_cursor = true,
    -- Stop at <EOF> when scrolling downwards
    stop_eof = true,
    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    respect_scrolloff = false,
    -- The cursor will keep on scrolling even if the window cannot scroll further
    cursor_scrolls_alone = true,
    -- Default easing function
    easing_function = nil,
    -- Function to run before the scrolling animation starts
    pre_hook = nil,
    -- Function to run after the scrolling animation ends
    post_hook = nil,
    -- Disable "Performance Mode" on all buffers.
    performance_mode = false,
  })
end)

-- stabilize.nvim
table.insert(config, function()
  local ok, plugin = pcall(require, "stabilize")
  if not ok then
    log("stabilize not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({
    -- stabilize window even when current cursor position will be hidden behind new window
    force = true,
    -- set context mark to register on force event which can be jumped to with '<forcemark>
    forcemark = nil,
    -- do not manage windows matching these file/buftypes
    ignore = {
      filetype = {},
      buftype = {},
    },
    -- comma-separated list of autocmds that wil trigger the plugins window restore function
    nested = nil,
  })
end)

-- nvim-tree.lua
table.insert(config, function()
  local ok, plugin = pcall(require, "nvim-tree")
  if not ok then
    log("nvim-tree not found", vim.log.levels.WARN)
    return
  end
  plugin.setup({
    sort_by = "case_sensitive",
    view = {
      adaptive_size = false,
      mappings = {
        custom_only = false,
        list = {},
      }
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
    },
    filters = {
      dotfiles = false,
      custom = { "^.git$" },
      exclude = { "^.gitignore$" },
    },
  })
end)

-- undotree
table.insert(config, function()
  local undodir = "/tmp/undodir"
  if vim.fn.has("persistent_undo") == 1 then
    vim.fn.mkdir(undodir, "p", 0700)
    vim.opt["undodir"] = undodir
    vim.opt["undofile"] = true
  end
end)


-- ===== startup =====
_M.setup = function()
  for _, func in pairs(config) do
    func()
  end
end

return _M

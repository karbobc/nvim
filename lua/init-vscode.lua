
-- package
local stdpath = vim.fn.stdpath

-- config table
local config = {}
local _M = {}
local vscode = require("vscode-neovim")


-- ===== autocmd ===== --
table.insert(config, function()
  local autocmd = require("autocmd")
  autocmd.setup()
end)


-- ===== options config ===== --
table.insert(config, function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
  vim.g.hlsearch = true
  vim.g.ignorecase = true
  vim.notify = vscode.notify
end)


-- ===== keymaps config ===== --


-- ===== lazy.nvim config ===== --
-- install lazy.nvim plugins automatically
table.insert(config, function()
  local lazypath = stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup({

    spec = {
      { import = "plugins/flash-nvim" },
      { import = "plugins/nvim-surround" },
      { import = "plugins/vim-visual-multi" },
      { import = "plugins/vim-easy-align" },
    },

    defaults = {
      -- should plugins be lazy-loaded?
      lazy = false,
      version = nil,
    },

    ---@type number limit the maximum amount of concurrent tasks
    concurrency = jit.os:find("windows") and (vim.loop.available_parallelism() * 2) or nil,

    install = {
      -- install missing plugins on startup. this doesn't increase startup time.
      missing = true,
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = { "vscode" },
    },

    -- automatically check for plugin updates
    checker = {
      enabled = false,
      ---@type number? set to 1 to check for updates very slowly
      concurrency = nil,
      -- get a notification when new updates are found
      notify = true,
      -- check for updates every hour
      frequency = 3600,
      -- check for pinned packages that can't be updated
      check_pinned = false,
    },

    -- automatically check for config file changes and reload the ui
    change_detection = {
      enabled = false,
      -- get a notification when changes are found
      notify = true,
    },

    performance = {
      cache = {
        enabled = true,
      },
      -- reset the package path to improve startup time
      reset_packpath = true,
      rtp = {
        -- reset the runtime path to $vimruntime and your config directory
        reset = true,
        ---@type string[]
        -- add any custom paths here that you want to includes in the rtp
        paths = {},
        ---@type string[] list any plugins you want to disable here
        disabled_plugins = {
          -- "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwplugin",
          -- "tarplugin",
          -- "tohtml",
          -- "tutor",
          -- "zipplugin",
        },
      },
    },
  })
end)


-- ===== startup ===== --
_M.setup = function()
  for _, func in ipairs(config) do
    func()
  end
end

return _M



-- package
local stdpath = vim.fn.stdpath

-- config table
local config = {}
local _M = {}


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


-- ===== lazy.nvim config ===== --
table.insert(config, function()
  -- install lazy.nvim plugins automatically
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
      { import = "plugins" },
    },

    defaults = {
      -- should plugins be lazy-loaded?
      lazy = false,
      version = nil,
    },

    ---@type number limit the maximum amount of concurrent tasks
    concurrency = nil,

    install = {
      -- install missing plugins on startup. This doesn't increase startup time.
      missing = true,
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = { "vscode" },
    },

    -- automatically check for plugin updates
    checker = {
      enabled = true,
      ---@type number? set to 1 to check for updates very slowly
      concurrency = nil,
      -- get a notification when new updates are found
      notify = false,
      -- check for updates every hour
      frequency = 3600,
    },

    performance = {
      cache = {
        enabled = true,
      },
      -- reset the package path to improve startup time
      reset_packpath = true,
      rtp = {
        -- reset the runtime path to $VIMRUNTIME and your config directory
        reset = true,
        ---@type string[]
        -- add any custom paths here that you want to includes in the rtp
        paths = {},
        ---@type string[] list any plugins you want to disable here
        disabled_plugins = {
          -- "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          -- "tarPlugin",
          -- "tohtml",
          -- "tutor",
          -- "zipPlugin",
        },
      },
    },
  })
end)


-- ===== startup =====
_M.setup = function()
  for _, func in ipairs(config) do
    func()
  end
end

return _M


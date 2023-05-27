return {
  "goolord/alpha-nvim",
  lazy = true,
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val = {
      dashboard.button("e", "📄 New File", "<cmd>ene<cr>"),
      dashboard.button("SPC f f", "🧐 Find Files", "<cmd>Files<cr>"),
      dashboard.button("SPC f h", "🕣 Open Recent", "<cmd>History<cr>"),
      dashboard.button("SPC f m", "📑 Find Bookmarks", "<cmd>Marks<cr>"),
      dashboard.button("q", "💤 Quit Nvim", "<cmd>qa<cr>"),
    }
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end
    -- setup alpha
    local plugin = require("alpha")
    plugin.setup(dashboard.opts)
    -- footer
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

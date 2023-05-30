return {
  "windwp/nvim-autopairs",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local plugin = require("nvim-autopairs")
    plugin.setup()
    local ok, cmp = pcall(require, "cmp")
    if ok then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}

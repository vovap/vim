local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "nvim-cmp",
  },
}

function M.config()
  local autopairs = require "nvim-autopairs"
  local cmp = require "cmp"

  local options = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  }

  autopairs.setup(options)

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return M

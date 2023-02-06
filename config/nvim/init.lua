require "core.options"
require "core.autocmds"
require "core.keymaps"

require "core.lazy"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function() end,
})

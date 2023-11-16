return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "linrongbin16/lsp-progress.nvim",
  },
  opts = function(plugin)
    local assets = {
      mode_icon = "",
      sep_right = "",
      dir = "", -- "",
      file = "", -- ""
      modified = "",
      lsp = {
        server = "",
        error = " ",
        warn = " ",
        info = " ",
        hint = " ", -- " ",
      },
      git = {
        branch = "",
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    local lualine = require "lualine"

    local function lsp_client(msg)
      msg = msg or "No Active Lsp"
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return ""
        end
        return msg
      end

      local buf_client_names = {}

      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      return table.concat(buf_client_names, ", ")
    end

    local lazy_ok, lazy = pcall(require, "lazy.status")
    local pending_updates = lazy_ok and lazy.updates
    local has_pending_updates = lazy_ok and lazy.has_updates

    return {
      options = {
        -- component_separators = "|",
        component_separators = "",
        -- section_separators = { left = assets.sep_right, right = "" },
        section_separators = "",
        -- theme = "auto",
        -- theme = "catppuccin",
        icons_enabled = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          { "mode", icon = assets.mode_icon },
        },
        lualine_c = {
          {
            "branch",
            icon = assets.git.branch,
            on_click = function()
              vim.cmd [[Telescope git_branches]]
            end,
          },
          {
            "diff",
            symbols = assets.git,
            on_click = function()
              vim.cmd [[DiffviewOpen --selected-file=%s]]
            end,
          },
          "progress",
          "location",
          {
            function()
              return require("lsp-progress").progress {
                max_size = 80,
                format = function(messages)
                  local active_clients = vim.lsp.get_active_clients()
                  if #messages > 0 then
                    return table.concat(messages, " ")
                  end
                  local client_names = {}
                  for _, client in ipairs(active_clients) do
                    if client and client.name ~= "" then
                      table.insert(client_names, 1, client.name)
                    end
                  end
                  return table.concat(client_names, "  ")
                end,
              }
            end,
            icon = "",
            color = { gui = "bold" },
            on_click = function()
              vim.cmd [[LspInfo]]
            end,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = assets.lsp,
            on_click = function()
              vim.cmd [[TroubleToggle document_diagnostics]]
            end,
          },
          {
            pending_updates,
            cond = has_pending_updates,
            on_click = function()
              vim.cmd [[Lazy sync]]
            end,
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 0, right = 0 } },
          { "filename", path = 0, symbols = { modified = assets.modified, readonly = "", unnamed = "Empty" } },
        },
        lualine_y = {
          {
            function()
              local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              return dir_name
            end,
            icon = assets.dir,
            on_click = function()
              vim.cmd [[Telescope projects]]
            end,
          },
        },
        lualine_z = {},
      },
      extensions = { "quickfix", "toggleterm", "symbols-outline", "neo-tree", "lazy", "nvim-dap-ui", "trouble" },
    }
  end,
  config = function (_, opts)
    require("lualine").setup(opts)

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end
}

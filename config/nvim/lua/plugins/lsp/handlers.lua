local M = {}

function M.setup()
  -- local signs = { Error = " ", Warn = " ", Info = " ", Hint = "" }
  -- local signs = { Error = ' ', Warn = ' ', Info = ' ', Hint = ' ' }
  local diagnostics = { Error = " ", Warning = " ", Information = " ", Hint = " " }
  local signs = {
    { name = "DiagnosticSignError", text = diagnostics.Error },
    { name = "DiagnosticSignWarn", text = diagnostics.Warning },
    { name = "DiagnosticSignHint", text = diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = diagnostics.Info },
  }
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  -- LSP handlers configuration
  local config = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },

    diagnostic = {
      -- virtual_text = false,
      -- virtual_text = { spacing = 4, prefix = "●" },
      virtual_text = { severity = vim.diagnostic.severity.ERROR },
      -- signs = {
      --   active = signs,
      -- },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
  }
  -- local border_opts = { border = "single", focusable = false, scope = "line" }

  -- Diagnostic configuration
  vim.diagnostic.config(config.diagnostic)

  -- Disable inline diagnostics error
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
  })

  -- Hover configuration
  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)

  -- Signature help configuration
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

return M

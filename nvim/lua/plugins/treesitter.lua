local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local options = {
  ensure_installed = {
    "norg",
    "cmake",
    "comment",
    "dockerfile",
    "graphql",
    "html",
    "http",
    "regex",
    "ruby",
    "scss",
    "bash",
    "javascript",
    "json",
    "toml",
    "lua",
    "typescript",
    "tsx",
    "css",
    "rust",
    "yaml",
    "markdown",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  context_commentstring = {
    enable = true,
  },
  rainbow = { enable = true, extended_mode = true },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
  },
  endwise = {
    enable = true,
  },
}

treesitter.setup(options)
return {
  {
    "dinhhuy258/git.nvim",
    event = "VeryLazy",
    -- cmd = { "Git", "GitBlame", "GitDiff", "GitDiffClose", "GitCreatePullRequest", "GitRevert", "GitRevertFile" },
    -- keys = {
    --   {
    --     "<leader>gD",
    --     "<CMD>lua require('git.blame').blame()<CR>",
    --     desc = "ﲀ   git blame",
    --   },
    -- },
    config = true,
  },
  { "gennaro-tedesco/nvim-jqx", cmd = { "JqxQuery", "JqxList" } },
  {
    "ruifm/gitlinker.nvim",
    keys = {
      {
        "<leader>gY",
        function()
          -- require("gitlinker.actions").copy_to_clipboard()
          require("gitlinker").get_buf_range_url(
            "n",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "   open line in browser",
      },
      {
        "<leader>gY",
        function()
          -- require("gitlinker.actions").copy_to_clipboard()
          require("gitlinker").get_buf_range_url(
            "v",
            { action_callback = require("gitlinker.actions").open_in_browser }
          )
        end,
        desc = "   open lines in browser",
        mode = "v",
      },
      {
        "<leader>gB",
        function()
          require("gitlinker").get_repo_url { action_callback = require("gitlinker.actions").open_in_browser }
        end,
        desc = "   open repo in browser",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      "<C-Up>",
      "<C-Down>",
    },
  },
  -- {
  --   "filipdutescu/renamer.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function()
  --     require("renamer").setup()
  --   end,
  -- },
  {
    "chaoren/vim-wordmotion",
    event = "VeryLazy",
  },
  {
    "phaazon/hop.nvim",
    name = "hop",
    keys = {
      { "f", "<cmd> HopWord<CR>", desc = "hop word", mode = { "n", "x", "v" } },
    },
    cmd = {
      "HopWord",
      "HopChar1",
    },
    config = true,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    cmd = { "TodoTrouble", "TodoTelescope" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "narutoxy/dim.lua",
    event = "BufReadPre",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "neovim/nvim-lspconfig",
    },
    config = true,
  },
  {
    "ur4ltz/surround.nvim",
    keys = { { "s", mode = { "v", "x" } } },
    opts = {
      mappings_style = "sandwich",
    },
  },
  {
    "saecki/crates.nvim",
    event = { "BufReadPre Cargo.toml" },
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      null_ls = {
        enabled = true,
        name = "crates.nvim",
      },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    config = function()
      require("symbols-outline").setup {}
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "booperlv/nvim-gomove",
    keys = {
      "<A-h>",
      "<A-j>",
      "<A-k>",
      "<A-l>",
    },
    config = true,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "RRethy/nvim-treesitter-endwise",
    event = "InsertEnter",
    ft = { "ruby", "lua" },
  },
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    opts = {
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true, -- Enable 'cursorline' for the window while peeking
    },
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact" },
    event = "InsertEnter",
  },
  -- {
  --   "nvim-treesitter/playground",
  --   cmd = { "TSCaptureUnderCursor", "TSPlaygroundToggle" },
  --   config = function()
  --     require("nvim-treesitter.configs").setup()
  --   end,
  -- }
  {
    "mfussenegger/nvim-treehopper",
    keys = {
      {
        "m",
        ":<C-U>lua require('tsht').nodes()<CR>",
        desc = "Treehopper Visual",
        mode = { "v" },
        silent = true,
      },
      {
        "m",
        ":lua require('tsht').nodes()<CR>",
        mode = { "o" },
        desc = "Treehopper",
        silent = true,
      },
    },
  },
}

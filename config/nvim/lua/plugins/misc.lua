return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts)
      require("refactoring").setup(opts)
      require("telescope").load_extension "refactoring"
    end,
    keys = {
      {
        "<leader>rr",
        function()
          require("telescope").extensions.refactoring.refactors()
        end,
        mode = { "v" },
        desc = "Refactor",
      },
    },
  },
  {
    "chrisbra/csv.vim",
    ft = "csv",
  },
  {
    "dinhhuy258/git.nvim",
    -- event = "VeryLazy",
    -- cmd = { "Git", "GitBlame", "GitDiff", "GitDiffClose", "GitCreatePullRequest", "GitRevert", "GitRevertFile" },
    keys = {
      {
        "<leader>gD",
        "<CMD>lua require('git.blame').blame()<CR>",
        desc = "ﲀ   git blame",
      },
    },
    opts = {
      default_mappings = false,
    },
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
  },
  {
    "mg979/vim-visual-multi",
    keys = {
      "<C-n>",
      { "<C-Up>", mode = "i" },
      { "<C-Down>", mode = "i" },
    },
  },
  -- {
  --   "filipdutescu/renamer.nvim",
  --   event = "VeryLazy",
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
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = true,
    keys = {
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    },
  },
  {
    "zbirenbaum/neodim",
    -- event = "BufReadPre",
    event = "LspAttach",
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
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
    keys = {
      { "<leader>d", "<cmd>SymbolsOutline<CR>", desc = "   toggle symbols outline" },
    },
    config = true,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "booperlv/nvim-gomove",
    keys = {
      { "<A-h>", mode = { "n", "x", "v" } },
      { "<A-j>", mode = { "n", "x", "v" } },
      { "<A-k>", mode = { "n", "x", "v" } },
      { "<A-l>", mode = { "n", "x", "v" } },
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

  -- library used by other plugins
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/popup.nvim" },
}

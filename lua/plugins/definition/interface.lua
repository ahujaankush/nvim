return {
  {
    "goolord/alpha-nvim",
    dependencies = { "ahujaankush/base46" },
    event = "VimEnter",
    config = function()
      require "plugins.configs.interface.alpha"
    end,
  },
  {
    "ahujaankush/base46",
    branch = "v2.0",
    lazy = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "mawkler/modicator.nvim",
    event = "BufRead",
    config = function()
      require "plugins.configs.interface.modicator"
    end,
  },
  -- Zen Mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "plugins.configs.interface.zenmode"
    end,
  },
  -- buffer + tab line
  {
    "akinsho/bufferline.nvim",
    event = "BufRead",
    dependencies = {
      "famiu/bufdelete.nvim",
      {
        "tiagovla/scope.nvim",
        config = function()
          require("scope").setup { restore_state = false }
        end,
      },
    },
    init = function()
      require("core.utils").load_mappings "bufferline"
    end,
    config = function()
      require "plugins.configs.interface.bufferline"
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    init = require("core.utils").load_mappings "saga",
    config = function()
      require "plugins.configs.interface.lspsaga"
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --lease make surr you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- lsp progress
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function()
      require "plugins.configs.interface.fidget"
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufRead",
    config = function()
      require "plugins.configs.interface.scrollbar"
    end,
  },
  -- nvim ui
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require "plugins.configs.interface.noice"
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "plugins.configs.interface.devicons"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    init = function()
      require("core.utils").load_mappings "blankline"
    end,
    config = function()
      require "plugins.configs.interface.blankline"
    end,
  },
  -- preview when entering line numbers
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require "plugins.configs.interface.numb"
    end,
  },
  -- code navigation
  {
    "SmiteshP/nvim-navbuddy",
    event = "LspAttach",
    init = function()
      require("core.utils").load_mappings "navbuddy"
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim", -- Optional
      "nvim-telescope/telescope.nvim", -- Optional
    },
    config = function()
      require "plugins.configs.interface.navbuddy"
    end,
  },
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    init = function()
      require("core.utils").load_mappings "trouble"
    end,
    config = function()
      require "plugins.configs.interface.trouble"
    end,
  },
  -- load luasnips + cmp related in insert mode only
  -- file managing , picker etc
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { "Neotree" },
    branch = "v3.x",
    init = function()
      require("core.utils").load_mappings "neotree"
    end,
    config = function ()
      require("plugins.configs.interface.neotree")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
  -- Only load whichkey after all the gui
  {
    "folke/which-key.nvim",
    keys = { "<leader>" },
    init = function()
      require("core.utils").load_mappings "whichkey"
    end,
    config = function()
      dofile(vim.g.base46_cache .. "whichkey")
      -- require("which-key").register(require("core.utils").load_config().mappings)
      require("which-key").setup()
    end,
  },
}

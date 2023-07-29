return {
  -- lsp stuff
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = function()
      require "plugins.configs.lsp.mason"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require "plugins.configs.lsp.masonlsp"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        -- format & linting
        {
          "jay-babu/mason-null-ls.nvim",
          dependencies = {
            "williamboman/mason.nvim",
            {
              "jose-elias-alvarez/null-ls.nvim",
              init = require("core.utils").load_mappings "null_ls",
              config = function()
                require "plugins.configs.lsp.null"
              end,
            },
          },
          config = function()
            require "plugins.configs.lsp.masonnull"
          end,
        },
        "williamboman/mason-lspconfig.nvim",
      },
    },
    init = function()
      require("core.utils").lazy_load "nvim-lspconfig"

    end,
    config = function()
      require "plugins.configs.lsp.lspconfig"
    end,
  },
  -- language specific plugins
  -- typescript (lsp)
  {
    "pmizio/typescript-tools.nvim",
    ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    build = ":MasonInstall typescript-language-server",
    config = function()
      require "plugins.configs.lsp.lang.typescript"
    end,
  },
  -- c/cpp (lsp)
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    build = { ":MasonInstall clangd", "npm -g i @vscode/codicons" },
    config = function()
      require "plugins.configs.lsp.lang.clangd"
    end,
  },
  -- jdtls
  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "williamboman/mason.nvim" },
    ft = "java",
    build = ":MasonInstall jdtls",
  },
  -- lua
  {
    "folke/neodev.nvim", -- neovim development
    ft = { "lua" },
    config = function()
      require "plugins.configs.lsp.neodev"
    end,
  },
  -- Rofi
  {
    "Fymyte/rasi.vim",
    ft = "rasi",
  },
  -- EWW (yuck)
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },
  {
    "nvim-neotest/neotest",
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- language specific
      "haydenmeade/neotest-jest",
    },
    config = function()
      require "plugins.configs.lsp.neotest"
    end,
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    event = "LspAttach",
    cmd = {
      "DapSetLogLevel",
      "DapShowLog",
      "DapContinue",
      "DapToggleBreakpoint",
      "DapToggleRepl",
      "DapStepOver",
      "DapStepInto",
      "DapStepOut",
      "DapTerminate",
    },
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          require("dapui").setup()
        end,
      },
      -- mason.nvim integration
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim" },
        cmd = { "DapInstall", "DapUninstall" },
        config = function()
          require "plugins.configs.lsp.masondap"
        end,
      },
    },
    config = function()
      require "plugins.configs.lsp.dap"
    end,
  },
  {
    "toppair/peek.nvim", -- markdown preview
    ft = { "markdown" },
    build = "deno task --quiet build:fast",
    config = function()
      require "plugins.configs.lsp.lang.peek"
    end,
  },
}

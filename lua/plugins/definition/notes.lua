return {
  -- Note taking
  {
    "nvim-orgmode/orgmode",
    enabled = false,
    lazy = false,
    config = function()
      require("plugins.configs.notes.org")
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = { "markdown" },
    rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
    config = function()
      require "plugins.configs.notes.markdown.mkdnflow"
    end,
  },
  {
    "nvim-neorg/neorg",
    cmd = { "Neorg" },
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    config = function()
      require "plugins.configs.notes.neorg"
    end,
  },
  -- images
  {
    "3rd/image.nvim",
    enabled = false,
    ft = { "markdown", "norg" },
    rocks = { "magick" },
    config = function()
      require "plugins.configs.notes.images"
    end,
  },
}

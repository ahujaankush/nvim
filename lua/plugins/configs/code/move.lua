local move = require "mini.move"

local options = {
  mappings = {
    -- Visual
    left = "<S-h>",
    right = "<S-l>",
    down = "<S-j>",
    up = "<S-k>",
    -- Normal
    line_left = "<S-h>",
    line_right = "<S-l>",
    line_down = "<S-j>",
    line_up = "<S-k>",
  },

  -- Options which control moving behavior
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
}

move.setup(options)

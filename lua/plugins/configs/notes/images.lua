local images = require "image"
local options = {
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      sizing_strategy = "auto",
      download_remote_images = true,
      clear_in_insert_mode = true,
    },
    neorg = {
      enabled = true,
      download_remote_images = true,
      clear_in_insert_mode = true,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 25,
  kitty_method = "normal",
  kitty_tmux_write_delay = 10, -- makes rendering more reliable with Kitty+Tmux
  window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
}

images.setup(options)

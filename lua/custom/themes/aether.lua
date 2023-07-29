local M = {}

M.base_30 = {
  white = "#c8ccd4",
  darker_black = "#0a0d11",
  black = "#14181e", --  nvim bg
  black2 = "#1c2229",
  one_bg = "#2d3139", -- real bg of onedark
  one_bg2 = "#323539",
  one_bg3 = "#43464a",
  grey = "#4a4d51",
  grey_fg = "#525659",
  grey_fg2 = "#575a5f",
  light_grey = "#5b5f63",
  red = "#f7467b",
  baby_pink = "#ff62a4",
  pink = "#ff67f9",
  line = "#31353d", -- for lines like vertsplit
  green = "#00ffb1",
  vibrant_green = "#1addb0",
  nord_blue = "#53befc",
  blue = "#2798e4",
  yellow = "#FFC457",
  sun = "#FFA246",
  purple = "#B467F9",
  dark_purple = "#9554ff",
  teal = "#2BCAFC",
  orange = "#ff8a30",
  cyan = "#2bfcfc",
  statusline_bg = "#15191e",
  lightbg = "#24282d",
  pmenu_bg = "#61afef",
  folder_bg = "#61afef",
}

M.base_16 = {
  base00 = "#14181e", --  nvim bg
  base01 = "#1c2229",
  base02 = "#2d3139",
  base03 = "#323539",
  base04 = "#43464a",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#B467F9",
  base09 = "#ff8a30",
  base0A = "#53befc",
  base0B = "#FFC457",
  base0C = "#2bfcfc",
  base0D = "#00ffb1",
  base0E = "#f7467b",
  base0F = "#ff62a4",
}

M.type = "dark"

M = require("base46").override_theme(M, "aether")

return M

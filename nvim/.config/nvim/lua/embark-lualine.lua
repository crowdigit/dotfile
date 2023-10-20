-- =============================================================================
-- Generated by lightline to lualine theme converter
--   https://gist.github.com/shadmansaleh/000871c9a608a012721c6acc6d7a19b9
-- License: MIT License
-- =============================================================================

local colors = {
  color14  = "#ffe9aa",
  color15  = "#ffb378",
  color2   = "#100E23",
  color3   = "#A1EFD3",
  color4   = "#62d196",
  color5   = "#cbe3e7",
  color6   = "#aaffe4",
  color7   = "#3E3859",
  color10  = "#F48FB1",
  color11  = "#ff5458",
}

local embark = {
    colors = {
        yellow      = colors.color14,
        orange      = colors.color15,
        black       = colors.color2,
        lightgreen  = colors.color3,
        green       = colors.color4,
        white       = colors.color5,
        lightgreen2 = colors.color6,
        gray        = colors.color7,
        pink        = colors.color10,
        red         = colors.color11,
    },
    theme = {
        replace = {
            a = { fg = colors.color2, bg = colors.color3 , gui = "bold", },
            b = { fg = colors.color2, bg = colors.color4 },
        },
        normal = {
            c = { fg = colors.color5, bg = colors.color2 },
            a = { fg = colors.color2, bg = colors.color6 , gui = "bold", },
            b = { fg = colors.color5, bg = colors.color7 },
        },
        inactive = {
            c = { fg = colors.color7, bg = colors.color2 },
            a = { fg = colors.color7, bg = colors.color2 , gui = "bold", },
            b = { fg = colors.color7, bg = colors.color2 },
        },
        insert = {
            a = { fg = colors.color2, bg = colors.color10 , gui = "bold", },
            b = { fg = colors.color2, bg = colors.color11 },
        },
        visual = {
            a = { fg = colors.color2, bg = colors.color14 , gui = "bold", },
            b = { fg = colors.color2, bg = colors.color15 },
        },
    },
}

return embark
-- Space
local space0 = { gui = "#100E23", cterm = "232", cterm16 = "0"}
local space1 = { gui = "#1e1c31", cterm = "233", cterm16 = "NONE"}
local space2 = { gui = "#2D2B40", cterm = "233", cterm16 = "NONE" }
local space3 = { gui = "#3E3859", cterm = "236", cterm16 = "8"}
local space4 = { gui = "#585273", cterm = "236", cterm16 = "8"}

-- Astral
local astral0 = { gui = "#8A889D", cterm = "252", cterm16 = "15"}
local astral1 = { gui = "#cbe3e7", cterm = "253", cterm16 = "7"}

-- Nebula
local red         = { gui = "#F48FB1", cterm = "204", cterm16 = "1"}
local dark_red    = { gui = "#F02E6E", cterm = "203", cterm16 = "9"}
local green       = { gui = "#A1EFD3", cterm = "120", cterm16 = "2"}
local dark_green  = { gui = "#7fe9c3", cterm = "119", cterm16 = "10"}
local yellow      = { gui = "#ffe6b3", cterm = "228", cterm16 = "3"}
local dark_yellow = { gui = "#F2B482", cterm = "215", cterm16 = "11"}
local blue        = { gui = "#91ddff", cterm = "159", cterm16 = "4"}
local dark_blue   = { gui = "#78a8ff", cterm = "135", cterm16 = "13"}
local purple      = { gui = "#d4bfff", cterm = "141", cterm16 = "5"}
local dark_purple = { gui = "#7676ff", cterm = "75", cterm16 = "12"}
local cyan        = { gui = "#ABF8F7", cterm = "122", cterm16 = "6"}
local dark_cyan   = { gui = "#63f2f1", cterm = "121", cterm16 = "14"}

local bg          = space1
local bg_dark     = space0
local bg_bright   = space4
local norm        = astral1
local norm_subtle = astral0
local visual      = space3
local head_a      = dark_blue
local head_b      = blue
local head_c      = dark_cyan

local diff_del = { gui = "#411E35", cterm = "203", cterm16 = "9"}
local diff_add = { gui = "#133246", cterm = "119", cterm16 = "10"}
local diff_changed = { gui = "#22244C", cterm = "215", cterm16 = "11"}

local embark = {
    colors = {
        space0      = space0,
        space1      = space1,
        space2      = space2,
        space3      = space3,
        space4      = space4,
        astral0     = astral0,
        astral1     = astral1,
        red         = red,
        dark_red    = dark_red,
        green       = green,
        dark_green  = dark_green,
        yellow      = yellow,
        dark_yellow = dark_yellow,
        blue        = blue,
        dark_blue   = dark_blue,
        purple      = purple,
        dark_purple = dark_purple,
        cyan        = cyan,
        dark_cyan   = dark_cyan,
    },
    theme = {
        replace = {
            a = { fg = space0.gui, bg = dark_red.gui , gui = "bold", },
            b = { fg = space0.gui, bg = red.gui },
            y = { fg = astral1.gui, bg = space3.gui },
        },
        normal = {
            c = { fg = astral1.gui, bg = space0.gui },
            a = { fg = space0.gui, bg = green.gui, gui = "bold", },
            b = { fg = astral1.gui, bg = space3.gui },
            y = { fg = astral1.gui, bg = space3.gui },
        },
        inactive = {
            c = { fg = space3.gui, bg = space0.gui },
            a = { fg = space3.gui, bg = space0.gui , gui = "bold", },
            b = { fg = space3.gui, bg = space0.gui },
            y = { fg = astral1.gui, bg = space3.gui },
        },
        insert = {
            a = { fg = space0.gui, bg = dark_yellow.gui , gui = "bold", },
            b = { fg = space0.gui, bg = yellow.gui },
            y = { fg = astral1.gui, bg = space3.gui },
        },
        visual = {
            a = { fg = space0.gui, bg = dark_purple.gui  , gui = "bold", },
            b = { fg = space0.gui, bg = dark_blue.gui },
            y = { fg = astral1.gui, bg = space3.gui },
        },
    },
}

return embark

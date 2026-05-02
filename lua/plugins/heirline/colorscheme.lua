local utils = require("heirline.utils")
local get_hl = utils.get_highlight

---@diagnostic disable
if vim.opt.termguicolors._value == false then
    heircolor_key = { ctermfg = 1, bold = true }
    heircolor_grey = { ctermfg = 8, ctermbg = 0 }
    heircolor_red = { ctermfg = 1 }
    heircolor_green = { ctermfg = 2 }
    heircolor_yellow = { ctermfg = 3 }
    heircolor_blue = { ctermfg = 4 }
    heircolor_magenta = { ctermfg = 5 }
    heircolor_cyan = { ctermfg = 6 }
    heircolor_white = { ctermfg = 7 }
    heircolor_bg = { ctermbg = 0 }
    heircolor_tabbg = { ctermbg = get_hl("Normal").bg }
    heircolor_sigil = { ctermfg = 0, ctermbg = get_hl("Normal").bg }
    heircolor_sigil2 = { ctermfg = 0, ctermbg = 0 }
    do
        local mode_colors = {
            normal = 7,
            insert = 5,
            visual = 3,
            visual_lines = 3,
            visual_block = 3,
            replace = 1,
            v_replace = 1,
            none = 1,
            enter = 2,
            command = 2,
            more = 2,
            terminal = 6,
            shell = 6,
            op = 4,
            select = 3,
        }
        Mode = setmetatable({
            normal = { ctermfg = 0 },
        }, {
            __index = function(_, mode)
                return {
                    ctermfg = 0,
                    ctermbg = mode_colors[mode],
                    bold = true,
                }
            end,
        })
    end
else
    heircolor_key = { fg = get_hl("Exception").fg, bold = true }
    heircolor_grey = { fg = get_hl("Comment").fg, bg = get_hl("StatusLine").bg }
    heircolor_red = { fg = get_hl("Statement").fg }
    heircolor_green = { fg = get_hl("Function").fg }
    heircolor_yellow = { fg = get_hl("String").fg }
    heircolor_blue = { fg = get_hl("Constant").fg }
    heircolor_magenta = { fg = get_hl("Number").fg }
    heircolor_cyan = { fg = get_hl("Tag").fg }
    heircolor_white = { fg = get_hl("StatusLine").fg }
    heircolor_bg = { bg = get_hl("StatusLine").bg }
    heircolor_tabbg = { bg = get_hl("Normal").bg }
    heircolor_sigil = { fg = get_hl("StatusLine").bg, bg = get_hl("Normal").bg }
    heircolor_sigil2 = { fg = get_hl("StatusLine").bg, bg = get_hl("StatusLine").bg }
    do
        local mode_colors = {
            normal = get_hl("StatusLine").fg,
            insert = get_hl("Number").fg,
            visual = get_hl("Include").fg,
            visual_lines = get_hl("Include").fg,
            visual_block = get_hl("Include").fg,
            replace = get_hl("Exception").fg,
            v_replace = get_hl("Exception").fg,
            none = get_hl("Exception").fg,
            enter = get_hl("Function").fg,
            command = get_hl("Function").fg,
            shell = get_hl("Tag").fg,
            terminal = get_hl("Tag").fg,
            more = get_hl("Function").fg,
            op = get_hl("Constant").fg,
            select = get_hl("Constant").fg,
        }
        Mode = setmetatable({
            normal = { fg = get_hl("StatusLine").bg },
        }, {
            __index = function(_, mode)
                return {
                    fg = get_hl("StatusLine").bg,
                    bg = mode_colors[mode],
                    bold = true,
                }
            end,
        })
    end
end

-- Initial setup ------------------------------------------------------------ {{

---@class Void Void has eveything and nothing
Void = setmetatable({}, { ---@type Void
    __index = function(self)
        return self
    end,
    __newindex = function() end,
    __call = function() end,
})

---Protected `require` function
---@return table | function | Void module
---@return boolean loaded if module was loaded or not
-- local function prequire(module_name)
--    local available, module = pcall(require, module_name)
--    if available then
--       return module, true
--    else
--       -- local home = os.getenv('HOME') --[[@as string]]
--       -- local source = debug.getinfo(2, "S").source:sub(2) :gsub(home, '~')
--       -- local msg = string.format('"%s" requested in "%s" not available', module_name, source)
--       -- vim.schedule(function() vim.notify_once(msg, vim.log.levels.WARN) end)
--       return Void, false
--    end
-- end
if not pcall(require, "heirline") then
    return
end

local os_sep = package.config:sub(1, 1)
local api = vim.api
local fn = vim.fn
local bo = vim.bo

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
-- local dap_available, dap = pcall(require, 'dap')
-- local dap = prequire('dap')
local misc = require("plugins.heirline.misc")
local icons = misc.icons
local mode = misc.mode
require("plugins.heirline.colorscheme")

-- }}

-- Buffer pick hotkey
vim.keymap.set("n", "<leader>b", function()
    local tabline = require("heirline").tabline
    local buflist = tabline._buflist[1]
    buflist._picker_labels = {}
    buflist._show_picker = true
    vim.cmd.redrawtabline()
    local char = vim.fn.getcharstr()
    local bufnr = buflist._picker_labels[char]
    if bufnr then
        vim.api.nvim_win_set_buf(0, bufnr)
    end
    buflist._show_picker = false
    vim.cmd.redrawtabline()
end, { desc = "Buffer picker" })

-- Some global components --------------------------------------------------- {{

-- Flexible components priorities
local priority = {
    CurrentPath = 60,
    Git = 40,
    WorkDir = 25,
    Lsp = 10,
}

local Align, Space, Null, ReadOnly
do
    Null = { provider = "" }
    Align = { provider = "%=" }
    Space = setmetatable({ provider = " " }, {
        __call = function(_, n)
            return { provider = string.rep(" ", n) }
        end,
    })
    ReadOnly = {
        condition = function()
            return not bo.modifiable or bo.readonly
        end,
        provider = icons.padlock,
        hl = { fg = "readonly" },
    }
end

local LeftCap = {
    provider = icons.left_end,
    hl = { fg = "dimgrey" },
}

local RightCap = {
    provider = icons.right_end,
    hl = { fg = "dimgrey" },
}

-- }}
-- Bufferline and Tabs ------------------------------------------------------ {{

local TabLineOffset = {
    condition = function(self)
        local win = vim.api.nvim_tabpage_list_wins(0)[1]
        local bufnr = vim.api.nvim_win_get_buf(win)
        self.winid = win

        if vim.bo[bufnr].filetype == "neo-tree" then
            self.title = "Tree"
            return true
            -- elseif vim.bo[bufnr].filetype == "TagBar" then
            --     ...
        end
    end,

    provider = function(self)
        local title = self.title
        local width = vim.api.nvim_win_get_width(self.winid)
        local pad = math.ceil((width - #title) / 2)
        return string.rep(" ", pad) .. title .. string.rep(" ", pad)
    end,

    hl = function(self)
        if vim.api.nvim_get_current_win() == self.winid then
            return "TablineSel"
        else
            return "Tabline"
        end
    end,
}

local TablineBufnr = {
    provider = function(self)
        if self.is_active then
            return tostring(self.bufnr) .. ": "
        else
            return tostring(self.bufnr) .. ": "
        end
    end,
}

local TablinePicker = {
    condition = function(self)
        return self._show_picker
    end,
    init = function(self)
        local bufname = vim.api.nvim_buf_get_name(self.bufnr)
        bufname = vim.fn.fnamemodify(bufname, ":t")
        local label = bufname:sub(1, 1)
        local i = 2
        while self._picker_labels[label] do
            if i > #bufname then
                break
            end
            label = bufname:sub(i, i)
            i = i + 1
        end
        self._picker_labels[label] = self.bufnr
        self.label = label .. " "
    end,
    provider = function(self)
        return self.label
    end,
    hl = { fg = "red_sigil", bold = true },
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local TablineFileName = {
    provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
    hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = true }
    end,
}

local TablineFileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
        end,
        provider = icons.modified,
        hl = { fg = "modified" },
    },
    {
        condition = function(self)
            return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
                or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
        end,
        provider = function(self)
            if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
                return icons.terminal
            else
                return icons.padlock
            end
        end,
        hl = { fg = "readonly" },
    },
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    hl = function(self)
        if self.is_active then
            return "TabLineSel" -- active buffer fg
        else
            return "TabLine" -- inactive buffer fg
        end
    end,
    on_click = {
        callback = function(_, minwid, _, button)
            if button == "m" then -- close on mouse middle click
                vim.schedule(function()
                    vim.api.nvim_buf_delete(minwid, { force = false })
                end)
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
    },
    TablineBufnr,
    TablinePicker,
    TablineFileName,
    TablineFileFlags,
}

-- The final touches
local TablineBuffers = {
    hl = { bg = "statusline_bg" }, -- surround icon bg
    utils.surround({ icons.left_surround, icons.right_surround }, function(self)
        if self.is_active then
            return "tablinesel_bg"
        else
            return "tabline_bg"
        end
    end, { TablineFileNameBlock }),
}

-- Add overflow sigils and finish
local BufferLineBlock = utils.make_buflist(
    TablineBuffers,
    { provider = icons.left_overflow, hl = { fg = "overflowsigil_fg", bg = "overflowsigil_bg" } },
    { provider = icons.right_overflow, hl = { fg = "overflowsigil_fg", bg = "overflowsigil_bg" } }
)

-- Now the tabs
local Tabpages = {
    hl = { bg = "statusline_bg" }, -- surround icon bg
    utils.surround({ icons.left_surround, icons.right_surround }, function(self)
        if self.is_active then
            return "tablinesel_bg"
        else
            return "tabline_bg"
        end
    end, {
        hl = function(self)
            if self.is_active then
                return "TabLineSel" -- active tab fg
            else
                return "TabLine" -- inactive tab fg
            end
        end,
        provider = function(self)
            if self.is_active then
                return icons.circle_small .. "%" .. self.tabnr .. "T " .. self.tabpage .. "%T"
            else
                return icons.circle_o .. "%" .. self.tabnr .. "T " .. self.tabpage .. "%T"
            end
        end,
    }),
}

local TablineBlock = {
    -- only show if there are 2 or more tabpages
    condition = function()
        return #vim.api.nvim_list_tabpages() >= 2
    end,
    utils.make_tablist(Tabpages),
}

-- Finish
TabLineFinal = {
    hl = { bg = "tablinefill" }, -- tabline bg (instead of tablinesel_bg)
    LeftCap,
    TabLineOffset,
    BufferLineBlock,
    Align,
    TablineBlock,
    RightCap,
}

-- }}
-- Left Statusline Elements ------------------------------------------------- {{

local Indicator
do
    local VimMode
    do
        local NormalModeIndicator = {
            Space,
            {
                fallthrough = false,
                ReadOnly,
                {
                    provider = icons.circle,
                    hl = function()
                        if bo.modified then
                            return { fg = "modified" }
                        else
                            return { fg = "miscgrey", bold = false }
                        end
                    end,
                },
            },
            Space,
        }

        local ActiveModeIndicator = {
            condition = function(self)
                return self.mode ~= "normal"
            end,
            utils.surround({ icons.left_mode_sur, icons.right_mode_sur }, function(self) -- color
                return Mode[self.mode].bg
            end, {
                {
                    fallthrough = false,
                    ReadOnly,
                    { provider = icons.circle },
                },
                Space,
                {
                    provider = function(self)
                        return misc.mode_lable[self.mode]
                    end,
                },
                hl = function(self)
                    return Mode[self.mode]
                end,
            }),
        }

        VimMode = {
            init = function(self)
                self.mode = mode[fn.mode(1)] -- :h mode()
            end,
            condition = function()
                return bo.buftype == ""
            end,
            {
                fallthrough = false,
                ActiveModeIndicator,
                NormalModeIndicator,
            },
        }
    end

    Indicator = {
        fallthrough = false,
        VimMode,
    }
end

local MacroRec = {
    condition = function()
        return vim.fn.reg_recording() ~= "" -- and vim.o.cmdheight == 0
    end,
    provider = icons.macro_rec,
    hl = { fg = "macrorec", bold = true },
    utils.surround({ "[", "] " }, nil, {
        provider = function()
            return vim.fn.reg_recording()
        end,
        hl = { fg = "lspindicator" },
    }),
    update = {
        "RecordingEnter",
        "RecordingLeave",
    },
}

local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = "filetype", bold = true },
}

local HelpFileName = {
    condition = function()
        return vim.bo.filetype == "help"
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        return vim.fn.fnamemodify(filename, ":t")
    end,
    hl = { fg = "lspindicator" },
}

local FileNameBlock, CurrentPath, FileName
do
    local WorkDir = {
        condition = function(self)
            if bo.buftype == "" then
                return self.pwd
            end
        end,
        hl = { fg = "workdir", bold = true },
        flexible = priority.WorkDir,
        {
            provider = function(self)
                return self.pwd
            end,
        },
        {
            provider = function(self)
                return fn.pathshorten(self.pwd)
            end,
        },
        Null,
    }

    CurrentPath = {
        condition = function(self)
            if bo.buftype == "" then
                return self.current_path
            end
        end,
        hl = { fg = "currentpath", bold = true },
        flexible = priority.CurrentPath,
        {
            provider = function(self)
                return self.current_path
            end,
        },
        {
            provider = function(self)
                return fn.pathshorten(self.current_path, 2)
            end,
        },
        { provider = "" },
    }

    FileName = {
        provider = function(self)
            return self.filename
        end,
        hl = { fg = "filename" },
    }

    FileNameBlock = {
        { WorkDir, CurrentPath, FileName },
        -- This means that the statusline is cut here when there's not enough space.
        { provider = "%<" },
    }
end

local SpecialBlock = {
    condition = function()
        return conditions.buffer_matches({
            buftype = { "nofile", "help", "quickfix", "acwrite" },
            filetype = { "^git.*" },
        })
    end,
    FileType,
    Space,
    HelpFileName,
}

local PromptBlock = {
    condition = function()
        return conditions.buffer_matches({
            buftype = { "prompt", "noice" },
        })
    end,
    provider = function()
        return "PROMPT"
    end,
    hl = { fg = "filetype", bold = true },
}

local TerminalBlock = {
    condition = function()
        return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    provider = function()
        -- local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        local index = require("terminal").current_term_index()
        return icons.terminal .. " TERMINAL " .. index
    end,
    hl = { fg = "termin" },
}

local FMBlock = {
    condition = function()
        return conditions.buffer_matches({ filetype = { "Fm" } })
    end,
    provider = function()
        return "FILES"
    end,
    hl = { fg = "filetype", bold = true },
}

-- }}
-- Right Statusline Elements ------------------------------------------------ {{

local AltBuf = {
    condition = function()
        return vim.fn.expand("#") ~= ""
    end,
    {
        -- provider = " #",
        provider = function()
            local name = vim.fn.bufname("#")
            if
                name == ""
                or vim.bo.filetype == "qf"
                or vim.bo.filetype == "Trouble"
                or vim.bo.filetype == "Outline"
            then
                return ""
            elseif string.match(vim.bo.filetype, "^neo") then
                return ""
            else
                return "#" .. name:match("[^/]*$") .. " "
            end
        end,
        hl = { fg = "miscgrey" },
    },
}

-- local DapMessages = {
--     -- display the dap messages only on the debugged file
--     condition = function()
--         -- local session = dap_available and dap.session()
--         local session = dap.session()
--         if session then
--             local filename = api.nvim_buf_get_name(0)
--             if session.config then
--                 local progname = session.config.program
--                 return filename == progname
--             end
--         end
--         return false
--     end,
--     provider = function()
--         return icons.bug .. dap.status() .. " "
--     end,
--     hl = { fg = "???" },
-- }

local Diagnostics = {
    Space,
    condition = conditions.has_diagnostics,
    static = {
        error_icon = fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },
    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            if self.errors > 0 then
                return table.concat({ self.error_icon, self.errors, " " })
            end
        end,
        hl = { fg = "diagerror" },
    },
    {
        provider = function(self)
            if self.warnings > 0 then
                return table.concat({ self.warn_icon, self.warnings, " " })
            end
        end,
        hl = { fg = "diagwarn" },
    },
    {
        provider = function(self)
            if self.info > 0 then
                return table.concat({ self.info_icon, self.info, " " })
            end
        end,
        hl = { fg = "diaginfo" },
    },
    {
        provider = function(self)
            if self.hints > 0 then
                return table.concat({ self.hint_icon, self.hints, " " })
            end
        end,
        hl = { fg = "diaghint" },
    },
}

local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0
            or self.status_dict.removed ~= 0
            or self.status_dict.changed ~= 0
    end,
    on_click = {
        callback = function(self, minwid, nclicks, button)
            vim.defer_fn(function()
                vim.cmd("Lazygit %:p:h")
            end, 100)
        end,
        name = "heirline_git",
        update = false,
    },
    hl = { fg = "git_branch", bold = true },
    {
        provider = function(self)
            return icons.git_branch .. self.status_dict.head
        end,
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "(",
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = "git_added", bold = true },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "git_deleted", bold = true },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "git_changed", bold = true },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ") ",
    },
}

local Lsp
do
    local LspIndicator = {
        provider = icons.circle_small .. " ",
        hl = { fg = "lspindicator" },
    }
    local LspServer = {
        Space,
        {
            provider = function(self)
                local names = self.lsp_names
                names = names[1] -- show only first server name (use below for full list)
                -- if #names == 1 then
                --     names = names[1]
                -- else
                --     names = table.concat(names, ", ")
                -- end
                return names
            end,
        },
        Space(2),
        hl = { fg = "lspserver", bold = false },
    }
    Lsp = {
        condition = conditions.lsp_attached,
        init = function(self)
            local names = {}
            for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
                table.insert(names, server.name)
            end
            self.lsp_names = names
        end,
        hl = function(self)
            local color
            for _, name in ipairs(self.lsp_names) do
                if lsp_colors[name] then
                    color = lsp_colors[name]
                    break
                end
            end
            if color then
                return { fg = color, bold = false, force = true }
            else
                return { fg = "lspserver", bold = false }
            end
        end,
        flexible = priority.Lsp,
        LspServer,
        LspIndicator,
    }
end

local SearchResults = {
    condition = function(self)
        local lines = api.nvim_buf_line_count(0)
        if lines > 50000 then
            return
        end

        local query = fn.getreg("/")
        if query == "" then
            return
        end

        if query:find("@") then
            return
        end

        local search_count = fn.searchcount({ recompute = 1, maxcount = -1 })
        local active = false
        if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
            active = true
        end
        if not active then
            return
        end

        query = query:gsub([[^\V]], "")
        query = query:gsub([[\<]], ""):gsub([[\>]], "")

        self.query = query
        self.count = search_count
        return true
    end,
    {
        provider = function(self)
            return table.concat({
                -- ' ', self.query, ' ', self.count.current, '/', self.count.total, ' '
                icons.search,
                self.count.current,
                "/",
                self.count.total,
            })
        end,
        hl = { fg = "searchresults" },
    },
    Space,
}

local Ruler = {
    condition = function()
        return conditions.width_percent_below(4, 0.05)
    end,
    -- %-2 : make item takes at least 2 cells and be left justified
    -- %l : current line number
    -- %L : number of lines in the buffer
    -- %v : column number
    -- provider = "%2(%v%) " .. icons.line_number .. " %-8(%l:%L%)",
    provider = "%l:%L ",
    hl = { bold = false },
}

local ScrollPercentage = {
    -- %P : percentage through file of displayed window
    provider = "[%3(%P%)] ",
    -- hl = { fg = "statusline_fg" }
}

-- local ScrollBar = {
--     static = {
--         sbar = icons.sbar,
--     },
--     provider = function(self)
--         local curr_line = vim.api.nvim_win_get_cursor(0)[1]
--         local lines = vim.api.nvim_buf_line_count(0)
--         local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
--         return string.rep(self.sbar[i], 1) -- width of the scrollbar (in characters)
--     end,
--     hl = { fg = "scrollbar" },
-- }

vim.opt.showcmdloc = "statusline"
local ShowCmd = {
    --   condition = function()
    --   	 return vim.o.timeout == false
    --   end,
    provider = "%(%S%) ",
    hl = { fg = "cmd" },
}

local Spell = {
    condition = function()
        return vim.wo.spell
    end,
    provider = icons.spellcheck,
    hl = { fg = "spellindicator", bold = true },
}
-- }}
-- Combine Statusline ------------------------------------------------------- {{

local StatusLineFinal = {
    init = function(self)
        local pwd = fn.getcwd(0) -- Present working directory.
        local current_path = api.nvim_buf_get_name(0)
        local filename

        if current_path == "" then
            pwd = fn.fnamemodify(pwd, ":~")
            current_path = ""
            filename = "/[No Name]"
        elseif current_path:find(pwd, 1, true) then
            filename = fn.fnamemodify(current_path, ":t")
            current_path = fn.fnamemodify(current_path, ":~:.:h")
            pwd = fn.fnamemodify(pwd, ":~") .. os_sep
            if current_path == "." then
                current_path = ""
            else
                current_path = current_path .. os_sep
            end
        else
            pwd = ""
            filename = fn.fnamemodify(current_path, ":t")
            current_path = fn.fnamemodify(current_path, ":~:.:h") .. os_sep
        end

        self.pwd = pwd
        self.current_path = current_path -- The opened file path relevant to pwd.
        self.filename = filename
    end,
    hl = { fg = "statusline_fg", bg = "statusline_bg" },
    {
        LeftCap,
        Indicator,
        Space,
        MacroRec,
        {
            fallthrough = false,
            PromptBlock,
            SpecialBlock,
            FMBlock,
            TerminalBlock,
            FileNameBlock,
        },
        Space(2),
        AltBuf,
        -- GPS,
        Align,
        ShowCmd,
        -- DapMessages,
        SearchResults,
        Spell,
        Git,
        Diagnostics,
        Lsp,
        Ruler,
        -- ScrollBar,
        ScrollPercentage,
        RightCap,
    },
}

-- }}
-- Combine All -------------------------------------------------------------- {{

require("heirline").setup({
    statusline = StatusLineFinal,
    -- winbar = WinBars,
    tabline = TabLineFinal,
    -- statuscolumn = ...
})

vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])
-- }}
-- vim: set fdm=marker fmr={{,}}:

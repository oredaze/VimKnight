return {
    -- Search and replace
    {
        'MagicDuck/grug-far.nvim',
        -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
        -- additional lazy config to defer loading is not really needed...
        config = function()
            -- optional setup call to override plugin options
            -- alternatively you can set options with vim.g.grug_far = { ... }
            require('grug-far').setup({
                -- options, see Configuration section below
                -- there are no required options atm
                enabledEngines = { 'ripgrep' },
                transient = true,
                keymaps = {
                    replace = { n = '<localleader>s' },
                    qflist = { n = '<localleader>q' },
                    syncLocations = { n = '<localleader>L' },
                    syncLine = { n = '<localleader>l' },
                    close = { n = '<localleader>c' },
                    historyOpen = { n = '<localleader>h' },
                    historyAdd = { n = '<localleader>a' },
                    refresh = { n = '<localleader>r' },
                    openLocation = { n = '<localleader>o' },
                    openNextLocation = { n = '<down>' },
                    openPrevLocation = { n = '<up>' },
                    gotoLocation = { n = '<enter>' },
                    pickHistoryEntry = { n = '<enter>' },
                    abort = { n = '<localleader>b' },
                    help = { n = '?' },
                    toggleShowCommand = { n = '<localleader>x' },
                    previewLocation = { n = '<localleader>i' },
                    applyNext = { n = '<localleader>j' },
                    applyPrev = { n = '<localleader>k' },
                    syncNext = { n = '<localleader>n' },
                    syncPrev = { n = '<localleader>p' },
                    syncFile = { n = '<localleader>v' },
                    nextInput = { n = '<tab>' },
                    prevInput = { n = '<s-tab>' },
                },
                icons = {
                    enabled = true,
                    -- provider to use for file icons
                    -- values: 'first_available', 'nvim-web-devicons', 'mini.icons', false (disable)
                    fileIconsProvider = 'first_available',

                    actionEntryBullet = ' ',

                    searchInput = ' ',
                    replaceInput = ' ',
                    filesFilterInput = '󰈳 ',
                    flagsInput = '󱂳 ',
                    pathsInput = '󰷏 ',

                    resultsStatusReady = '󱩾 ',
                    resultsStatusError = '󰅚 ',
                    resultsStatusSuccess = '󰗡 ',
                    resultsActionMessage = ' 󰗖 ',
                    resultsEngineLeft = '<',
                    resultsEngineRight = '>',
                    resultsChangeIndicator = '┃',
                    resultsAddedIndicator = '▒',
                    resultsRemovedIndicator = '▒',
                    resultsDiffSeparatorIndicator = '┊',
                    historyTitle = '   ',
                    helpTitle = ' 󰘥  ',
                    lineNumbersEllipsis = ' ',

                    newline = ' ',
                },
            });
        end
    },
}

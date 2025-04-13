"
" @@@@@@@@@@    @@@@@@   @@@  @@@   @@@@@@   @@@  @@@   @@@@@@
" @@@@@@@@@@@  @@@@@@@@  @@@  @@@  @@@@@@@   @@@  @@@  @@@@@@@@
" @@! @@! @@!  @@!  @@@  @@!  !@@  !@@       @@!  @@@  @@!  @@@
" !@! !@! !@!  !@!  @!@  !@!  @!!  !@!       !@!  @!@  !@!  @!@
" @!! !!@ @!@  @!@  !@!  @!@@!@!   !!@@!!    @!@!@!@!  @!@!@!@!
" !@!   ! !@!  !@!  !!!  !!@!!!     !!@!!!   !!!@!!!!  !!!@!!!!
" !!:     !!:  !!:  !!!  !!: :!!        !:!  !!:  !!!  !!:  !!!
" :!:     :!:  :!:  !:!  :!:  !:!      !:!   :!:  !:!  :!:  !:!
" :::     ::   ::::: ::   ::  :::  :::: ::   ::   :::  ::   :::
"  :      :     : :  :    :   :::  :: : :     :   : :   :   : :
"
" Name:         Moksha
" Author:       bitraven
" Description:  A colorscheme for the ascended
" License:      MIT

" Initialization: {{{
if !(exists('g:colors_name') && g:colors_name ==# 'moksha')
    highlight clear
    if exists('syntax_on')
        syntax reset
    endif
endif

set background=dark

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

let g:colors_name = 'moksha'
" }}}
" Configuration: {{{
let s:configuration = {}
let s:configuration.palette = get(g:, 'moksha_palette', {})
let s:configuration.cursor = get(g:, 'moksha_cursor', 'auto')
" }}}
" Palette: {{{{{{}}}
let s:palette = {
    \ 'bg_base':      ['#1A1918',   '235',  'Black'],
    \ 'bg_dark':      ['#141414',   '235',  'Black'],
    \ 'bg_darker':    ['#101010',   '236',  'Black'],
    \ 'black':        ['#0A0A0A',   '237',  'Black'],
    \ 'bg_red':       ['#45292E',   '52',   'DarkRed'],
    \ 'bg_green':     ['#313630',   '22',   'DarkGreen'],
    \ 'bg_blue':      ['#213338',   '17',   'DarkBlue'],
    \ 'bg_gray':      ['#333333',   '17',   'DarkGrey'],
    \ 'bg_code':      ['#212121',   '17',   'DarkGrey'],
    \ 'fg':           ['#e0d0b0',   '223',  'White'],
    \ 'fg_dim':       ['#B3A994',   '214',  'Gray'],
    \ 'fg_nc':        ['#8C8369',   '214',  'Gray'],
    \ 'cream':        ['#D5C095',   '223',  'White'],
    \ 'ash':          ['#8C8C8C',   '223',  'LightGrey'],
    \ 'greenash':     ['#9FAD95',   '223',  'LightGrey'],
    \ 'red':          ['#D96257',   '167',  'Red'],
    \ 'light_red':    ['#F98080',   '167',  'Red'],
    \ 'brown':        ['#C49774',   '175',  'blue'],
    \ 'burned':       ['#DE7B62',   '208',  'Red'],
    \ 'orange':       ['#E69363',   '175',  'blue'],
    \ 'yellow':       ['#F2C180',   '214',  'Yellow'],
    \ 'green':        ['#AAD188',   '108',  'Green'],
    \ 'cyan':         ['#99CCBB',   '108',  'Cyan'],
    \ 'cyan_dim':     ['#89B8A8',   '108',  'Cyan'],
    \ 'blue':         ['#96AED6',   '109',  'Blue'],
    \ 'pink':         ['#DBA2BF',   '175',  'blue'],
    \ 'light_blue':   ['#FFC9C9',   '175',  'brown'],
    \ 'light_grey':   ['#73655B',   '237',  'DarkGrey'],
    \ 'grey':         ['#544C46',   '245',  'Grey'],
    \ 'dark_grey':    ['#302E2D',   '245',  'LightGrey'],
    \ 'search':       ['#CCA974',   '245',  'LightGrey'],
    \ 'select':       ['#382D2A',   '214',  'DarkGrey'],
    \ 'illuminate':   ['#272A2E',   '214',  'Gray'],
    \ 'focusindent':  ['#665043',   '214',  'Gray'],
    \ 'dred':         ['#A6524B',   '167',  'Red'],
    \ 'dburned':      ['#A6765B',   '208',  'Red'],
    \ 'dblue':        ['#7890A6',   '109',  'Blue'],
    \ 'dgrey':        ['#808080',   '109',  'Blue'],
    \ 'none':         ['NONE',      'NONE', 'NONE']
    \ }

call extend(s:palette, s:configuration.palette)
" }}}
" Function: {{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)

if &term == 'linux'
    function! s:HL(group, fg, bg, ...)
        let hl_string = [
                    \ 'highlight', a:group,
                    \ 'ctermfg=' . a:fg[2],
                    \ 'ctermbg=' . a:bg[2],
                    \ ]
        if a:0 >= 1
            if a:1 ==# 'undercurl'
                call add(hl_string, 'cterm=underline')
            else
                call add(hl_string, 'cterm=' . a:1)
            endif
        else
            call add(hl_string, 'cterm=NONE')
        endif
        execute join(hl_string, ' ')
    endfunction
else
    function! s:HL(group, fg, bg, ...)
        let hl_string = [
                    \ 'highlight', a:group,
                    \ 'guifg=' . a:fg[0],
                    \ 'guibg=' . a:bg[0],
                    \ ]
        if a:0 >= 1
            if a:1 ==# 'undercurl'
                call add(hl_string, 'gui=undercurl')
                call add(hl_string, 'cterm=underline')
            else
                call add(hl_string, 'gui=' . a:1)
                call add(hl_string, 'cterm=' . a:1)
            endif
        else
            call add(hl_string, 'gui=NONE')
            call add(hl_string, 'cterm=NONE')
        endif
        if a:0 >= 2
            call add(hl_string, 'guisp=' . a:2[0])
        endif
        execute join(hl_string, ' ')
    endfunction
endif
" }}}

" UI: {{{
call s:HL('Normal', s:palette.fg, s:palette.bg_base)
call s:HL('Terminal', s:palette.fg, s:palette.bg_darker)
call s:HL('EndOfBuffer', s:palette.grey, s:palette.none)
call s:HL('SignColumn', s:palette.fg, s:palette.bg_darker)
call s:HL('LineNr', s:palette.grey, s:palette.bg_dark)
call s:HL('CursorLineNr', s:palette.yellow, s:palette.bg_dark, 'bold')
call s:HL('Folded', s:palette.cream, s:palette.bg_dark)
hi! link FoldColumn Folded
call s:HL('ColorColumn', s:palette.none, s:palette.bg_red)
call s:HL('Conceal', s:palette.grey, s:palette.none)
if s:configuration.cursor ==# 'auto'
    call s:HL('Cursor', s:palette.none, s:palette.none, 'reverse')
    call s:HL('lCursor', s:palette.none, s:palette.none, 'reverse')
elseif s:configuration.cursor ==# 'red'
    call s:HL('Cursor', s:palette.bg_base, s:palette.red)
    call s:HL('lCursor', s:palette.bg_base, s:palette.red)
elseif s:configuration.cursor ==# 'green'
    call s:HL('Cursor', s:palette.bg_base, s:palette.green)
    call s:HL('lCursor', s:palette.bg_base, s:palette.green)
elseif s:configuration.cursor ==# 'blue'
    call s:HL('Cursor', s:palette.bg_base, s:palette.blue)
    call s:HL('lCursor', s:palette.bg_base, s:palette.blue)
endif
call s:HL('CursorColumn', s:palette.none, s:palette.bg_darker)
call s:HL('CursorLine', s:palette.none, s:palette.bg_darker)
call s:HL('DiffAdd', s:palette.none, s:palette.bg_green)
call s:HL('DiffDelete', s:palette.grey, s:palette.bg_darker)
call s:HL('DiffChange', s:palette.none, s:palette.bg_blue)
call s:HL('DiffText', s:palette.none, s:palette.bg_red)
call s:HL('Directory', s:palette.cyan_dim, s:palette.none)
call s:HL('ErrorMsg', s:palette.red, s:palette.bg_dark, 'bold')
call s:HL('WarningMsg', s:palette.yellow, s:palette.bg_dark, 'bold')
call s:HL('ModeMsg', s:palette.pink, s:palette.none, 'bold')
call s:HL('MoreMsg', s:palette.cyan, s:palette.none, 'bold')
call s:HL('MsgArea', s:palette.none, s:palette.bg_darker)
call s:HL('Search', s:palette.bg_darker, s:palette.search)
call s:HL('IncSearch', s:palette.bg_darker, s:palette.orange)
hi! link CurSearch IncSearch
call s:HL('MatchParen', s:palette.blue, s:palette.bg_darker, 'bold')
call s:HL('NonText', s:palette.grey, s:palette.none)
call s:HL('Whitespace', s:palette.dark_grey, s:palette.none)
call s:HL('NormalFloat', s:palette.fg, s:palette.bg_dark)
call s:HL('FloatTitle', s:palette.light_grey, s:palette.bg_dark)
call s:HL('FloatBorder', s:palette.light_grey, s:palette.bg_dark)
hi! link Pmenu NormalFloat
call s:HL('PmenuSel', s:palette.none, s:palette.select)
call s:HL('PmenuSbar', s:palette.none, s:palette.none)
call s:HL('PmenuThumb', s:palette.none, s:palette.grey)
call s:HL('ScrollView', s:palette.light_grey, s:palette.none)
call s:HL('WildMenu', s:palette.bg_base, s:palette.fg)
call s:HL('Question', s:palette.yellow, s:palette.none)
call s:HL('SpellBad', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call s:HL('SpellCap', s:palette.none, s:palette.none, 'undercurl', s:palette.light_grey)
call s:HL('SpellLocal', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
call s:HL('SpellRare', s:palette.none, s:palette.none, 'undercurl', s:palette.pink)
call s:HL('StatusLine', s:palette.fg_dim, s:palette.bg_dark, 'bold')
call s:HL('StatusLineTerm', s:palette.fg_dim, s:palette.bg_dark, 'bold')
call s:HL('StatusLineNC', s:palette.fg_nc, s:palette.bg_dark)
call s:HL('StatusLineTermNC', s:palette.fg_nc, s:palette.bg_dark)
call s:HL('TabLineSel', s:palette.cream, s:palette.bg_base, 'bold')
call s:HL('TabLine', s:palette.light_grey, s:palette.bg_darker)
call s:HL('TabLineFill', s:palette.light_grey, s:palette.bg_dark)
call s:HL('WinBar', s:palette.none, s:palette.bg_darker)
hi! link WinBar WinBarNC
call s:HL('VertSplit', s:palette.burned, s:palette.bg_dark)
hi! link WinSeparator VertSplit
call s:HL('Visual', s:palette.none, s:palette.select)
call s:HL('VisualNOS', s:palette.none, s:palette.select, 'underline')
call s:HL('CursorIM', s:palette.none, s:palette.fg)
call s:HL('ToolbarLine', s:palette.none, s:palette.grey)
call s:HL('ToolbarButton', s:palette.fg, s:palette.bg_base, 'bold')
call s:HL('QuickFixLine', s:palette.blue, s:palette.bg_darker)
call s:HL('Debug', s:palette.burned, s:palette.none)
" }}}
" Syntax: {{{
call s:HL('Constant', s:palette.blue, s:palette.none)
call s:HL('Boolean', s:palette.blue, s:palette.none, 'italic')
call s:HL('Number', s:palette.pink, s:palette.none)
call s:HL('Float', s:palette.pink, s:palette.none)
call s:HL('Function', s:palette.green, s:palette.none, 'italic')
call s:HL('Type', s:palette.brown, s:palette.none, 'italic')
call s:HL('PreProc', s:palette.yellow, s:palette.none)
call s:HL('PreCondit', s:palette.yellow, s:palette.none)
call s:HL('Include', s:palette.yellow, s:palette.none)
call s:HL('Define', s:palette.yellow, s:palette.none)
call s:HL('Conditional', s:palette.red, s:palette.none)
call s:HL('Repeat', s:palette.red, s:palette.none)
call s:HL('Keyword', s:palette.red, s:palette.none)
call s:HL('Typedef', s:palette.brown, s:palette.none, 'bold')
call s:HL('Exception', s:palette.red, s:palette.none, 'bold')
call s:HL('Statement', s:palette.red, s:palette.none)
call s:HL('StorageClass', s:palette.brown, s:palette.none, 'italic')
call s:HL('Title', s:palette.orange, s:palette.none, 'bold')
call s:HL('Character', s:palette.cyan, s:palette.none, 'bold')
call s:HL('Macro', s:palette.orange, s:palette.none, 'bold')
call s:HL('Error', s:palette.burned, s:palette.none)
call s:HL('Tag', s:palette.orange, s:palette.none, 'bold')
call s:HL('Label', s:palette.yellow, s:palette.none)
call s:HL('Structure', s:palette.brown, s:palette.none)
call s:HL('Operator', s:palette.yellow, s:palette.none)
call s:HL('Special', s:palette.burned, s:palette.none)
call s:HL('SpecialChar', s:palette.blue, s:palette.none, 'bold')
call s:HL('Identifier', s:palette.fg, s:palette.none)
call s:HL('SpecialKey', s:palette.blue, s:palette.none)
call s:HL('String', s:palette.cyan, s:palette.none, 'italic')
call s:HL('Comment', s:palette.light_grey, s:palette.none, 'italic')
call s:HL('SpecialComment', s:palette.light_grey, s:palette.none, 'italic')
call s:HL('Todo', s:palette.blue, s:palette.bg_gray, 'italic')
call s:HL('Delimiter', s:palette.ash, s:palette.none)
call s:HL('Ignore', s:palette.grey, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline', s:palette.cyan)
" }}}
" Predefined Highlight Groups: {{{
call s:HL('Fg', s:palette.fg, s:palette.none)
call s:HL('Grey', s:palette.grey, s:palette.none)
call s:HL('Yellow', s:palette.yellow, s:palette.none)
call s:HL('Blue', s:palette.blue, s:palette.none)
call s:HL('RedItalic', s:palette.red, s:palette.none, 'italic')
call s:HL('burnedItalic', s:palette.burned, s:palette.none, 'italic')
call s:HL('blueItalic', s:palette.blue, s:palette.none, 'italic')
call s:HL('Red', s:palette.red, s:palette.none)
call s:HL('Pink', s:palette.pink, s:palette.none)
call s:HL('Burned', s:palette.burned, s:palette.none)
call s:HL('Green', s:palette.green, s:palette.none)
call s:HL('Cyan', s:palette.cyan, s:palette.none)
call s:HL('RedSign', s:palette.red, s:palette.bg_darker)
call s:HL('BurnedSign', s:palette.burned, s:palette.bg_darker)
call s:HL('YellowSign', s:palette.yellow, s:palette.bg_darker)
call s:HL('GreenSign', s:palette.green, s:palette.bg_darker)
call s:HL('CyanSign', s:palette.cyan, s:palette.bg_darker)
call s:HL('BlueSign', s:palette.blue, s:palette.bg_darker)
" }}}
" Markdown: {{{
" builtin: {{{
call s:HL('markdownH1', s:palette.red, s:palette.none, 'bold')
call s:HL('markdownH2', s:palette.burned, s:palette.none, 'bold')
call s:HL('markdownH3', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH4', s:palette.yellow, s:palette.none, 'bold')
call s:HL('markdownH5', s:palette.yellow, s:palette.none, 'bold')
call s:HL('markdownH6', s:palette.yellow, s:palette.none, 'bold')
call s:HL('markdownUrl', s:palette.grey, s:palette.none, 'underline')
call s:HL('markdownItalic', s:palette.yellow, s:palette.none, 'none')
call s:HL('markdownBold', s:palette.none, s:palette.none, 'bold')
call s:HL('markdownItalicDelimiter', s:palette.grey, s:palette.none, 'none')
call s:HL('markdownCodeDelimiter', s:palette.light_grey, s:palette.none)
call s:HL('markdownCodeBlock', s:palette.green, s:palette.none)
call s:HL('markdownCode', s:palette.green, s:palette.none, 'italic')
hi! link markdownBlockquote Grey
hi! link markdownListMarker Pink
hi! link markdownOrderedListMarker Pink
hi! link markdownRule Grey
hi! link markdownLinkText Cyan
hi! link markdownHeadingRule Grey
hi! link markdownUrlDelimiter Grey
hi! link markdownLinkDelimiter Grey
hi! link markdownLinkTextDelimiter Grey
hi! link markdownHeadingDelimiter Grey
hi! link markdownUrlTitleDelimiter Yellow
hi! link markdownIdDeclaration markdownLinkText
hi! link markdownBoldDelimiter Grey
hi! link markdownId Yellow
" }}}
hi! link markdownAutomaticLink Cyan
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
call s:HL('mkdURL', s:palette.blue, s:palette.none, 'underline')
call s:HL('mkdInlineURL', s:palette.blue, s:palette.none, 'underline')
call s:HL('mkdItalic', s:palette.grey, s:palette.none, 'italic')
highlight! link mkdCodeDelimiter Green
highlight! link mkdBold Grey
highlight! link mkdLink Blue
highlight! link mkdHeading Grey
highlight! link mkdListItem Pink
highlight! link mkdRule Grey
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" }}}
" LaTex: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
highlight! link texStatement Green
highlight! link texOnlyMath Grey
highlight! link texDefName Yellow
highlight! link texNewCmd Burned
highlight! link texCmdName Blue
highlight! link texBeginEnd Red
highlight! link texBeginEndName Blue
highlight! link texDocType blue
highlight! link texDocTypeArgs Burned
" }}}
" }}}
" Html: {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax{{{
call s:HL('htmlH1', s:palette.red, s:palette.none, 'bold')
call s:HL('htmlH2', s:palette.orange, s:palette.none, 'bold')
call s:HL('htmlH3', s:palette.yellow, s:palette.none, 'bold')
call s:HL('htmlH4', s:palette.green, s:palette.none, 'bold')
call s:HL('htmlH5', s:palette.cyan, s:palette.none, 'bold')
call s:HL('htmlH6', s:palette.blue, s:palette.none, 'bold')
call s:HL('htmlLink', s:palette.brown, s:palette.none, 'underline')
call s:HL('htmlBold', s:palette.none, s:palette.none, 'bold')
call s:HL('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call s:HL('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call s:HL('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call s:HL('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call s:HL('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call s:HL('htmlItalic', s:palette.none, s:palette.none, 'italic')
call s:HL('htmlTag', s:palette.light_grey, s:palette.none)
call s:HL('htmlTagN', s:palette.pink, s:palette.none)
highlight! link htmlEndTag Blue
" call s:HL('htmlTagName', s:palette.green, s:palette.none)
highlight! link htmlArg Cyan
highlight! link htmlScriptTag blue
highlight! link htmlSpecialTagName RedItalic
" }}}
" }}}
" Xml: {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
highlight! link xmlTag Green
highlight! link xmlEndTag Blue
highlight! link xmlTagName burnedItalic
highlight! link xmlEqual Burned
highlight! link xmlAttrib Cyan
highlight! link xmlEntity Red
highlight! link xmlEntityPunct Red
highlight! link xmlDocTypeDecl Grey
highlight! link xmlDocTypeKeyword blueItalic
highlight! link xmlCdataStart Grey
highlight! link xmlCdataCdata blue
" }}}
" }}}
" CSS: {{{
" builtin: https://github.com/JulesWang/css.vim{{{
highlight! link cssAttrComma Fg
highlight! link cssBraces Fg
highlight! link cssTagName blueItalic
highlight! link cssClassNameDot Red
highlight! link cssClassName RedItalic
highlight! link cssFunctionName Yellow
highlight! link cssAttr Burned
highlight! link cssProp Cyan
highlight! link cssCommonAttr Yellow
highlight! link cssPseudoClassId Blue
highlight! link cssPseudoClassFn Green
highlight! link cssPseudoClass blue
highlight! link cssImportant RedItalic
highlight! link cssSelectorOp Burned
highlight! link cssSelectorOp2 Burned
highlight! link cssColor Green
highlight! link cssAttributeSelector Cyan
highlight! link cssUnitDecorators Burned
highlight! link cssValueLength Green
highlight! link cssValueInteger Green
highlight! link cssValueNumber Green
highlight! link cssValueAngle Green
highlight! link cssValueTime Green
highlight! link cssValueFrequency Green
highlight! link cssVendor Grey
highlight! link cssNoise Grey
" }}}
" }}}
" LESS: {{{
" vim-less: https://github.com/groenewege/vim-less{{{
highlight! link lessMixinChar Grey
highlight! link lessClass RedItalic
highlight! link lessVariable Blue
highlight! link lessAmpersandChar Burned
highlight! link lessFunction Yellow
" }}}
" }}}
" JavaScript: {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
highlight! link javaScriptNull Cyan
highlight! link javaScriptIdentifier Burned
highlight! link javaScriptParens Fg
highlight! link javaScriptBraces Fg
highlight! link javaScriptGlobal blue
highlight! link javaScriptMessage Yellow
highlight! link javaScriptFunction RedItalic
highlight! link javaScriptOperator Burned
highlight! link javaScriptMember Cyan
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript{{{
highlight! link jsThis blue
highlight! link jsUndefined Cyan
highlight! link jsNull Cyan
highlight! link jsNan Cyan
highlight! link jsSuper blue
highlight! link jsPrototype blue
highlight! link jsFunction RedItalic
highlight! link jsGlobalNodeObjects blueItalic
highlight! link jsGlobalObjects Yellow
highlight! link jsArrowFunction blue
highlight! link jsArrowFuncArgs Blue
highlight! link jsFuncArgs Blue
highlight! link jsObjectProp Cyan
highlight! link jsVariableDef Blue
highlight! link jsObjectKey Cyan
highlight! link jsParen Blue
highlight! link jsParenIfElse Blue
highlight! link jsParenRepeat Blue
highlight! link jsParenSwitch Blue
highlight! link jsParenCatch Blue
highlight! link jsBracket Blue
highlight! link jsBlockLabel Cyan
highlight! link jsFunctionKey Green
highlight! link jsClassDefinition Yellow
highlight! link jsDot Grey
highlight! link jsDestructuringBlock Blue
highlight! link jsSpreadExpression blue
highlight! link jsSpreadOperator Green
highlight! link jsModuleKeyword Yellow
highlight! link jsObjectValue Blue
highlight! link jsbrownlateExpression LightGray
highlight! link jsbrownlateBraces Yellow
highlight! link jsClassMethodType Burned
" }}}
" yajs: https://github.com/othree/yajs.vim{{{
highlight! link javascriptEndColons Fg
highlight! link javascriptOpSymbol Burned
highlight! link javascriptOpSymbols Burned
highlight! link javascriptIdentifierName Blue
highlight! link javascriptVariable Burned
highlight! link javascriptObjectLabel Cyan
highlight! link javascriptObjectLabelColon Grey
highlight! link javascriptPropertyNameString Cyan
highlight! link javascriptFuncArg Blue
highlight! link javascriptIdentifier blue
highlight! link javascriptArrowFunc blue
highlight! link javascriptbrownlate Yellow
highlight! link javascriptbrownlateSubstitution Yellow
highlight! link javascriptbrownlateSB Yellow
highlight! link javascriptNodeGlobal blueItalic
highlight! link javascriptDocTags blueItalic
highlight! link javascriptDocNotation blue
highlight! link javascriptClassSuper blue
highlight! link javascriptClassName Yellow
highlight! link javascriptClassSuperName Yellow
highlight! link javascriptBrackets Fg
highlight! link javascriptBraces Fg
highlight! link javascriptLabel blue
highlight! link javascriptDotNotation Grey
highlight! link javascriptGlobalArrayDot Grey
highlight! link javascriptGlobalBigIntDot Grey
highlight! link javascriptGlobalDateDot Grey
highlight! link javascriptGlobalJSONDot Grey
highlight! link javascriptGlobalMathDot Grey
highlight! link javascriptGlobalNumberDot Grey
highlight! link javascriptGlobalObjectDot Grey
highlight! link javascriptGlobalPromiseDot Grey
highlight! link javascriptGlobalRegExpDot Grey
highlight! link javascriptGlobalStringDot Grey
highlight! link javascriptGlobalSymbolDot Grey
highlight! link javascriptGlobalURLDot Grey
highlight! link javascriptMethod Green
highlight! link javascriptMethodName Green
highlight! link javascriptObjectMethodName Green
highlight! link javascriptGlobalMethod Green
highlight! link javascriptDOMStorageMethod Green
highlight! link javascriptFileMethod Green
highlight! link javascriptFileReaderMethod Green
highlight! link javascriptFileListMethod Green
highlight! link javascriptBlobMethod Green
highlight! link javascriptURLStaticMethod Green
highlight! link javascriptNumberStaticMethod Green
highlight! link javascriptNumberMethod Green
highlight! link javascriptDOMNodeMethod Green
highlight! link javascriptES6BigIntStaticMethod Green
highlight! link javascriptBOMWindowMethod Green
highlight! link javascriptHeadersMethod Green
highlight! link javascriptRequestMethod Green
highlight! link javascriptResponseMethod Green
highlight! link javascriptES6SetMethod Green
highlight! link javascriptReflectMethod Green
highlight! link javascriptPaymentMethod Green
highlight! link javascriptPaymentResponseMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptGeolocationMethod Green
highlight! link javascriptES6MapMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptCacheMethod Green
highlight! link javascriptFunctionMethod Green
highlight! link javascriptXHRMethod Green
highlight! link javascriptBOMNavigatorMethod Green
highlight! link javascriptServiceWorkerMethod Green
highlight! link javascriptDOMEventTargetMethod Green
highlight! link javascriptDOMEventMethod Green
highlight! link javascriptIntlMethod Green
highlight! link javascriptDOMDocMethod Green
highlight! link javascriptStringStaticMethod Green
highlight! link javascriptStringMethod Green
highlight! link javascriptSymbolStaticMethod Green
highlight! link javascriptRegExpMethod Green
highlight! link javascriptObjectStaticMethod Green
highlight! link javascriptObjectMethod Green
highlight! link javascriptBOMLocationMethod Green
highlight! link javascriptJSONStaticMethod Green
highlight! link javascriptGeneratorMethod Green
highlight! link javascriptEncodingMethod Green
highlight! link javascriptPromiseStaticMethod Green
highlight! link javascriptPromiseMethod Green
highlight! link javascriptBOMHistoryMethod Green
highlight! link javascriptDOMFormMethod Green
highlight! link javascriptClipboardMethod Green
highlight! link javascriptTypedArrayStaticMethod Green
highlight! link javascriptBroadcastMethod Green
highlight! link javascriptDateStaticMethod Green
highlight! link javascriptDateMethod Green
highlight! link javascriptConsoleMethod Green
highlight! link javascriptArrayStaticMethod Green
highlight! link javascriptArrayMethod Green
highlight! link javascriptMathStaticMethod Green
highlight! link javascriptSubtleCryptoMethod Green
highlight! link javascriptCryptoMethod Green
highlight! link javascriptProp Cyan
highlight! link javascriptBOMWindowProp Cyan
highlight! link javascriptDOMStorageProp Cyan
highlight! link javascriptFileReaderProp Cyan
highlight! link javascriptURLUtilsProp Cyan
highlight! link javascriptNumberStaticProp Cyan
highlight! link javascriptDOMNodeProp Cyan
highlight! link javascriptRequestProp Cyan
highlight! link javascriptResponseProp Cyan
highlight! link javascriptES6SetProp Cyan
highlight! link javascriptPaymentProp Cyan
highlight! link javascriptPaymentResponseProp Cyan
highlight! link javascriptPaymentAddressProp Cyan
highlight! link javascriptPaymentShippingOptionProp Cyan
highlight! link javascriptTypedArrayStaticProp Cyan
highlight! link javascriptServiceWorkerProp Cyan
highlight! link javascriptES6MapProp Cyan
highlight! link javascriptRegExpStaticProp Cyan
highlight! link javascriptRegExpProp Cyan
highlight! link javascriptXHRProp Cyan
highlight! link javascriptBOMNavigatorProp Green
highlight! link javascriptDOMEventProp Cyan
highlight! link javascriptBOMNetworkProp Cyan
highlight! link javascriptDOMDocProp Cyan
highlight! link javascriptSymbolStaticProp Cyan
highlight! link javascriptSymbolProp Cyan
highlight! link javascriptBOMLocationProp Cyan
highlight! link javascriptEncodingProp Cyan
highlight! link javascriptCryptoProp Cyan
highlight! link javascriptBOMHistoryProp Cyan
highlight! link javascriptDOMFormProp Cyan
highlight! link javascriptDataViewProp Cyan
highlight! link javascriptBroadcastProp Cyan
highlight! link javascriptMathStaticProp Cyan
" }}}
" }}}
" JavaScript React: {{{
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
highlight! link jsxTagName burnedItalic
highlight! link jsxOpenPunct Green
highlight! link jsxClosePunct Blue
highlight! link jsxEscapeJs Blue
highlight! link jsxAttrib Cyan
" }}}
" }}}
" TypeScript: {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim{{{
highlight! link typescriptSource blueItalic
highlight! link typescriptMessage Yellow
highlight! link typescriptGlobalObjects Cyan
highlight! link typescriptInterpolation Yellow
highlight! link typescriptInterpolationDelimiter Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
highlight! link typescriptMethodAccessor burnedItalic
highlight! link typescriptVariable Burned
highlight! link typescriptVariableDeclaration Blue
highlight! link typescriptTypeReference Yellow
highlight! link typescriptBraces Fg
highlight! link typescriptEnumKeyword RedItalic
highlight! link typescriptEnum Yellow
highlight! link typescriptIdentifierName Cyan
highlight! link typescriptProp Cyan
highlight! link typescriptCall Blue
highlight! link typescriptInterfaceName Yellow
highlight! link typescriptEndColons Fg
highlight! link typescriptMember Cyan
highlight! link typescriptMemberOptionality Burned
highlight! link typescriptObjectLabel Cyan
highlight! link typescriptArrowFunc blue
highlight! link typescriptAbstract Burned
highlight! link typescriptObjectColon Grey
highlight! link typescriptTypeAnnotation Grey
highlight! link typescriptAssign Burned
highlight! link typescriptBinaryOp Burned
highlight! link typescriptUnaryOp Burned
highlight! link typescriptFuncComma Fg
highlight! link typescriptClassName Yellow
highlight! link typescriptClassHeritage Yellow
highlight! link typescriptInterfaceHeritage Yellow
highlight! link typescriptIdentifier blue
highlight! link typescriptGlobal blue
highlight! link typescriptOperator RedItalic
highlight! link typescriptNodeGlobal blueItalic
highlight! link typescriptExport blueItalic
highlight! link typescriptDefaultParam Burned
highlight! link typescriptImport blueItalic
highlight! link typescriptTypeParameter Yellow
highlight! link typescriptReadonlyModifier Burned
highlight! link typescriptAccessibilityModifier Burned
highlight! link typescriptAmbientDeclaration RedItalic
highlight! link typescriptbrownlateSubstitution Yellow
highlight! link typescriptbrownlateSB Yellow
highlight! link typescriptExceptions RedItalic
highlight! link typescriptCastKeyword RedItalic
highlight! link typescriptOptionalMark Burned
highlight! link typescriptNull Cyan
highlight! link typescriptMappedIn RedItalic
highlight! link typescriptFuncTypeArrow blue
highlight! link typescriptTernaryOp Burned
highlight! link typescriptParenExp Blue
highlight! link typescriptIndexExpr Blue
highlight! link typescriptDotNotation Grey
highlight! link typescriptGlobalNumberDot Grey
highlight! link typescriptGlobalStringDot Grey
highlight! link typescriptGlobalArrayDot Grey
highlight! link typescriptGlobalObjectDot Grey
highlight! link typescriptGlobalSymbolDot Grey
highlight! link typescriptGlobalMathDot Grey
highlight! link typescriptGlobalDateDot Grey
highlight! link typescriptGlobalJSONDot Grey
highlight! link typescriptGlobalRegExpDot Grey
highlight! link typescriptGlobalPromiseDot Grey
highlight! link typescriptGlobalURLDot Grey
highlight! link typescriptGlobalMethod Green
highlight! link typescriptDOMStorageMethod Green
highlight! link typescriptFileMethod Green
highlight! link typescriptFileReaderMethod Green
highlight! link typescriptFileListMethod Green
highlight! link typescriptBlobMethod Green
highlight! link typescriptURLStaticMethod Green
highlight! link typescriptNumberStaticMethod Green
highlight! link typescriptNumberMethod Green
highlight! link typescriptDOMNodeMethod Green
highlight! link typescriptPaymentMethod Green
highlight! link typescriptPaymentResponseMethod Green
highlight! link typescriptHeadersMethod Green
highlight! link typescriptRequestMethod Green
highlight! link typescriptResponseMethod Green
highlight! link typescriptES6SetMethod Green
highlight! link typescriptReflectMethod Green
highlight! link typescriptBOMWindowMethod Green
highlight! link typescriptGeolocationMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptCacheMethod Green
highlight! link typescriptES6MapMethod Green
highlight! link typescriptFunctionMethod Green
highlight! link typescriptRegExpMethod Green
highlight! link typescriptXHRMethod Green
highlight! link typescriptBOMNavigatorMethod Green
highlight! link typescriptServiceWorkerMethod Green
highlight! link typescriptIntlMethod Green
highlight! link typescriptDOMEventTargetMethod Green
highlight! link typescriptDOMEventMethod Green
highlight! link typescriptDOMDocMethod Green
highlight! link typescriptStringStaticMethod Green
highlight! link typescriptStringMethod Green
highlight! link typescriptSymbolStaticMethod Green
highlight! link typescriptObjectStaticMethod Green
highlight! link typescriptObjectMethod Green
highlight! link typescriptJSONStaticMethod Green
highlight! link typescriptEncodingMethod Green
highlight! link typescriptBOMLocationMethod Green
highlight! link typescriptPromiseStaticMethod Green
highlight! link typescriptPromiseMethod Green
highlight! link typescriptSubtleCryptoMethod Green
highlight! link typescriptCryptoMethod Green
highlight! link typescriptBOMHistoryMethod Green
highlight! link typescriptDOMFormMethod Green
highlight! link typescriptConsoleMethod Green
highlight! link typescriptDateStaticMethod Green
highlight! link typescriptDateMethod Green
highlight! link typescriptArrayStaticMethod Green
highlight! link typescriptArrayMethod Green
highlight! link typescriptMathStaticMethod Green
highlight! link typescriptStringProperty Cyan
highlight! link typescriptDOMStorageProp Cyan
highlight! link typescriptFileReaderProp Cyan
highlight! link typescriptURLUtilsProp Cyan
highlight! link typescriptNumberStaticProp Cyan
highlight! link typescriptDOMNodeProp Cyan
highlight! link typescriptBOMWindowProp Cyan
highlight! link typescriptRequestProp Cyan
highlight! link typescriptResponseProp Cyan
highlight! link typescriptPaymentProp Cyan
highlight! link typescriptPaymentResponseProp Cyan
highlight! link typescriptPaymentAddressProp Cyan
highlight! link typescriptPaymentShippingOptionProp Cyan
highlight! link typescriptES6SetProp Cyan
highlight! link typescriptServiceWorkerProp Cyan
highlight! link typescriptES6MapProp Cyan
highlight! link typescriptRegExpStaticProp Cyan
highlight! link typescriptRegExpProp Cyan
highlight! link typescriptBOMNavigatorProp Green
highlight! link typescriptXHRProp Cyan
highlight! link typescriptDOMEventProp Cyan
highlight! link typescriptDOMDocProp Cyan
highlight! link typescriptBOMNetworkProp Cyan
highlight! link typescriptSymbolStaticProp Cyan
highlight! link typescriptEncodingProp Cyan
highlight! link typescriptBOMLocationProp Cyan
highlight! link typescriptCryptoProp Cyan
highlight! link typescriptDOMFormProp Cyan
highlight! link typescriptBOMHistoryProp Cyan
highlight! link typescriptMathStaticProp Cyan
" }}}
" }}}
" C/C++: {{{
" vim-cpp-enhanced-highlight: https://github.com/octol/vim-cpp-enhanced-highlight{{{
highlight! link cppSTLnamespace blue
highlight! link cppSTLtype Yellow
highlight! link cppAccess blueItalic
highlight! link cppStructure RedItalic
highlight! link cppSTLios Cyan
highlight! link cppSTLiterator blueItalic
highlight! link cppSTLexception blue
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
highlight! link cppSTLVariable Cyan
" }}}
" }}}
" C#: {{{
" builtin: https://github.com/nickspoons/vim-cs{{{
highlight! link csUnspecifiedStatement blueItalic
highlight! link csStorage RedItalic
highlight! link csClass RedItalic
highlight! link csNewType Cyan
highlight! link csContextualStatement blueItalic
highlight! link csInterpolationDelimiter Yellow
highlight! link csInterpolation Yellow
highlight! link csEndColon Fg
" }}}
" }}}
" Python: {{{
" builtin: {{{
highlight! link pythonBuiltin Yellow
highlight! link pythonExceptions blue
highlight! link pythonDecoratorName Blue
" }}}
" python-syntax: https://github.com/vim-python/python-syntax{{{
highlight! link pythonExClass blue
highlight! link pythonBuiltinType Yellow
highlight! link pythonBuiltinObj Blue
highlight! link pythonDottedName blueItalic
highlight! link pythonBuiltinFunc Green
highlight! link pythonFunction Cyan
highlight! link pythonDecorator Burned
highlight! link pythonInclude Include
highlight! link pythonImport PreProc
highlight! link pythonRun Blue
highlight! link pythonCoding Grey
highlight! link pythonOperator Burned
highlight! link pythonConditional RedItalic
highlight! link pythonRepeat RedItalic
highlight! link pythonException RedItalic
highlight! link pythonNone Cyan
highlight! link pythonDot Grey
" }}}
" }}}
" Lua: {{{
" builtin: {{{
highlight! link luaFunc Green
highlight! link luaFunction Green
highlight! link luaTable Fg
highlight! link luaIn RedItalic
" }}}
" vim-lua: https://github.com/tbastos/vim-lua{{{
highlight! link luaFuncCall Green
highlight! link luaLocal Burned
highlight! link luaSpecialValue Green
highlight! link luaBraces Fg
highlight! link luaBuiltIn blue
highlight! link luaNoise Grey
highlight! link luaLabel blue
highlight! link luaFuncTable Yellow
highlight! link luaFuncArgName Blue
highlight! link luaEllipsis Burned
highlight! link luaDocTag Green
" }}}
" }}}
" Moonscript: {{{
" moonscript-vim: https://github.com/leafo/moonscript-vim{{{
highlight! link moonInterpDelim Yellow
highlight! link moonInterp Blue
highlight! link moonFunction Green
highlight! link moonLuaFunc Cyan
highlight! link moonSpecialVar blue
highlight! link moonObject Yellow
highlight! link moonDotAccess Grey
" }}}
" }}}
" Kotlin: {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim{{{
highlight! link ktSimpleInterpolation Yellow
highlight! link ktComplexInterpolation Yellow
highlight! link ktComplexInterpolationBrace Yellow
highlight! link ktStructure RedItalic
highlight! link ktKeyword Cyan
" }}}
" }}}
" Go: {{{
" builtin: https://github.com/google/vim-ft-go{{{
highlight! link goDirective blueItalic
highlight! link goConstants Cyan
highlight! link goDeclType burnedItalic
" }}}
" polyglot: {{{
highlight! link goPackage blueItalic
highlight! link goImport blueItalic
highlight! link goVarArgs Blue
highlight! link goBuiltins Green
highlight! link goPredefinedIdentifiers Cyan
highlight! link goVar Burned
" }}}
" }}}
" GDScript:: {{{
hi! link gdscriptOperator Operator
hi! link gdscriptBlockStart Statement
hi! link gdscriptNode Structure
" }}}
" PHP: {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
highlight! link phpVarSelector Blue
highlight! link phpDefine burnedItalic
highlight! link phpStructure RedItalic
highlight! link phpSpecialFunction Green
highlight! link phpInterpSimpleCurly Yellow
highlight! link phpComparison Burned
highlight! link phpMethodsVar Cyan
highlight! link phpMemberSelector Green
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim{{{
highlight! link phpParent Fg
highlight! link phpNowDoc Green
highlight! link phpFunction Green
highlight! link phpMethod Green
highlight! link phpClass Burned
highlight! link phpSuperglobals blue
" }}}
" }}}
" Ruby: {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
highlight! link rubyKeywordAsMethod Green
highlight! link rubyInterpolation Yellow
highlight! link rubyInterpolationDelimiter Yellow
highlight! link rubyStringDelimiter Green
highlight! link rubyBlockParameterList Blue
highlight! link rubyDefine RedItalic
highlight! link rubyModuleName blue
highlight! link rubyAccess Burned
highlight! link rubyAttribute Yellow
highlight! link rubyMacro RedItalic
" }}}
" }}}
" Haskell: {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
highlight! link haskellBrackets Blue
highlight! link haskellIdentifier Yellow
highlight! link haskellAssocType Cyan
highlight! link haskellQuotedType Cyan
highlight! link haskellType Cyan
highlight! link haskellDeclKeyword RedItalic
highlight! link haskellWhere RedItalic
highlight! link haskellDeriving blueItalic
highlight! link haskellForeignKeywords blueItalic
" }}}
" }}}
" Perl: {{{
" builtin: https://github.com/vim-perl/vim-perl{{{
highlight! link perlStatementPackage blueItalic
highlight! link perlStatementInclude blueItalic
highlight! link perlStatementStorage Burned
highlight! link perlStatementList Burned
highlight! link perlMatchStartEnd Burned
highlight! link perlVarSimpleMemberName Cyan
highlight! link perlVarSimpleMember Fg
highlight! link perlMethod Green
highlight! link podVerbatimLine Green
highlight! link podCmdText Yellow
" }}}
" }}}
" Shell: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
highlight! link shRange Fg
highlight! link shTestOpr Burned
highlight! link shOption Cyan
highlight! link bashStatement Burned
highlight! link shOperator Burned
highlight! link shQuote Green
highlight! link shSet Burned
highlight! link shSetList Blue
highlight! link shSnglCase Burned
highlight! link shVariable Blue
highlight! link shVarAssign Burned
highlight! link shCmdSubRegion Green
highlight! link shCommandSub Burned
highlight! link shFunctionOne Green
highlight! link shFunctionKey RedItalic
" }}}
" }}}
" Zsh: {{{
" builtin: https://github.com/chrisbra/vim-zsh{{{
highlight! link zshOptStart blueItalic
highlight! link zshOption Blue
highlight! link zshSubst Yellow
highlight! link zshFunction Green
highlight! link zshDeref Blue
highlight! link zshTypes Burned
highlight! link zshVariableDef Blue
" }}}
" }}}
" VimL: {{{
highlight! link vimLet Burned
highlight! link vimFunction Green
highlight! link vimIsCommand Fg
highlight! link vimUserFunc Green
highlight! link vimFuncName Green
highlight! link vimMap blueItalic
highlight! link vimNotation Cyan
highlight! link vimMapLhs Green
highlight! link vimMapRhs Green
highlight! link vimSetEqual Yellow
highlight! link vimSetSep Fg
highlight! link vimOption Cyan
highlight! link vimUserAttrbKey Yellow
highlight! link vimUserAttrb Green
highlight! link vimAutoCmdSfxList Cyan
highlight! link vimSynType Burned
highlight! link vimHiBang Burned
highlight! link vimSet Yellow
highlight! link vimSetSep Grey
" }}}
" Json: {{{
highlight! link jsonKeyword Burned
highlight! link jsonQuote Grey
highlight! link jsonBraces Fg
" }}}
" Yaml: {{{
highlight! link yamlKey Burned
highlight! link yamlConstant blue
" }}}
" Toml: https://github.com/cespare/vim-toml {{{
call s:HL('tomlTable', s:palette.red, s:palette.none, 'bold')
highlight! link tomlKey White
call s:HL('tomlString', s:palette.cyan, s:palette.none, 'italic')
highlight! link tomlBoolean Cyan
highlight! link tomlTableArray tomlTable
" }}}
" Diff: {{{
highlight! link diffAdded Green
highlight! link diffRemoved Red
highlight! link diffChanged Pink
highlight! link diffOldFile Yellow
highlight! link diffNewFile Burned
highlight! link diffFile Cyan
highlight! link diffLine Grey
highlight! link diffIndexLine Blue
" }}}
" Help: {{{
call s:HL('helpNote', s:palette.blue, s:palette.none, 'bold')
call s:HL('helpHeadline', s:palette.red, s:palette.none, 'bold')
call s:HL('helpHeader', s:palette.burned, s:palette.none, 'bold')
call s:HL('helpURL', s:palette.green, s:palette.none, 'underline')
call s:HL('helpHyperTextEntry', s:palette.yellow, s:palette.none, 'bold')
highlight! link helpHyperTextJump Yellow
highlight! link helpCommand Cyan
highlight! link helpExample Green
highlight! link helpSpecial Blue
highlight! link helpSectionDelim Grey
" }}}
" Diagnostics: {{{
call s:HL('DiagnosticError', s:palette.dred, s:palette.bg_darker, 'italic')
call s:HL('DiagnosticWarn', s:palette.dburned, s:palette.bg_darker, 'italic')
call s:HL('DiagnosticInfo', s:palette.dblue, s:palette.bg_darker, 'italic')
call s:HL('DiagnosticHint', s:palette.dgrey, s:palette.bg_darker, 'italic')
call s:HL('DiagnosticVirtualTextError', s:palette.dred, s:palette.bg_dark, 'italic')
call s:HL('DiagnosticVirtualTextWarn', s:palette.dburned, s:palette.bg_dark, 'italic')
call s:HL('DiagnosticVirtualTextInfo', s:palette.dblue, s:palette.bg_dark, 'italic')
call s:HL('DiagnosticVirtualTextHint', s:palette.dgrey, s:palette.bg_dark, 'italic')
call s:HL('DiagnosticUnderlineError', s:palette.none, s:palette.none, 'none', s:palette.red)
call s:HL('DiagnosticUnderlineWarn', s:palette.none, s:palette.none, 'none', s:palette.burned)
call s:HL('DiagnosticUnderlineInfo', s:palette.none, s:palette.none, 'none', s:palette.blue)
call s:HL('DiagnosticUnderlineHint', s:palette.none, s:palette.none, 'none', s:palette.dgrey)
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn DiagnosticWarn
hi! link DiagnosticSignInfo DiagnosticInfo
hi! link DiagnosticSignHint DiagnosticHint
" }}}
" Treesitter {{{
hi! link @attribute Constant
hi! link @constant.builtin Constant
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.special Delimiter
hi! link @function.builtin Function
hi! link @string.regex SpecialChar
hi! link @storageclass.lifetime Label
call s:HL('@punctuation.bracket', s:palette.ash, s:palette.none)
call s:HL('@keyword.return', s:palette.red, s:palette.none, 'bold')
call s:HL('@variable.builtin', s:palette.fg, s:palette.none, 'italic')
hi! link @constructor.lua @punctuation.bracket
call s:HL('@lsp.type.lifetime.rust', s:palette.yellow, s:palette.none, 'bold')
" }}}
" CPM {{{
hi! link CmpItemAbbr              Identifier
hi! link CmpItemKindText          Identifier
hi! link CmpItemKindFile          Identifier
hi! link CmpItemKindField         Identifier
hi! link CmpItemKindEnumMember    Identifier
hi! link CmpItemKindProperty      Identifier
hi! link CmpItemMenu              Identifier
hi! link CmpDocumentation         Identifier
hi! link CmpDocumentationBorder   FloatBorder
hi! link CmpItemAbbrMatch         Function
hi! link CmpItemAbbrMatchFuzzy    CmpItemAbbrMatch
hi! link CmpItemKindClass         Type
hi! link CmpItemKindConstant      Constant
hi! link CmpItemKindConstructor   Special
hi! link CmpItemKindCopilot       Special
hi! link CmpItemKindEnum          Type
hi! link CmpItemKindFolder        Directory
hi! link CmpItemKindFunction      Function
hi! link CmpItemKindInterface     Type
hi! link CmpItemKindKeyword       Keyword
hi! link CmpItemKindMethod        Function
hi! link CmpItemKindModule        Include
hi! link CmpItemKindOperator      Operator
hi! link CmpItemKindReference     String
hi! link CmpItemKindSnippet       Special
hi! link CmpItemKindStruct        Structure
hi! link CmpItemKindTypeParameter Identifier
hi! link CmpItemKindValue         String
hi! link CmpItemKindVariable      Identifier
" }}}
" Plugins: {{{
" Neorg {{{
call s:HL('@neorg.markup.verbatim', s:palette.greenash, s:palette.bg_dark)
call s:HL('@neorg.markup.superscript', s:palette.pink, s:palette.none)
hi! link @neorg.markup.subscript Structure
call s:HL('@neorg.markup.inline_math', s:palette.green, s:palette.none)
call s:HL('@neorg.markup.variable', s:palette.green, s:palette.none)
hi! link @neorg.headings.1.prefix markdownH1
hi! link @neorg.headings.1.title markdownH1
hi! link @neorg.headings.2.prefix markdownH2
hi! link @neorg.headings.2.title markdownH2
hi! link @neorg.headings.3.prefix markdownH3
hi! link @neorg.headings.3.title markdownH3
hi! link @neorg.headings.4.prefix markdownH4
hi! link @neorg.headings.4.title markdownH4
hi! link @neorg.headings.5.prefix markdownH5
hi! link @neorg.headings.5.title markdownH5
hi! link @neorg.headings.6.prefix markdownH6
hi! link @neorg.headings.6.title markdownH6
call s:HL('@neorg.anchors.declaration', s:palette.blue, s:palette.none, 'underline')
call s:HL('@neorg.anchors.definition', s:palette.blue, s:palette.none, 'underline')
hi! link @neorg.links.location.url @neorg.anchors.definition
call s:HL('@neorg.links.location.external_file', s:palette.blue, s:palette.none, 'underline')
hi! link @neorg.links.location.external_file.prefix @neorg.links.location.external_file
call s:HL('@neorg.links.location.generic.prefix', s:palette.cyan, s:palette.none)
call s:HL('@neorg.links.location.generic', s:palette.cyan, s:palette.none)
call s:HL('@neorg.error', s:palette.red, s:palette.black)
call s:HL('@neorg.delimiters.horizontal_line', s:palette.light_grey, s:palette.none)
call s:HL('@neorg.delimiters.strong', s:palette.light_grey, s:palette.none)
call s:HL('@neorg.delimiters.weak', s:palette.light_grey, s:palette.none)
call s:HL('@neorg.lists.ordered.prefix', s:palette.pink, s:palette.none)
call s:HL('@neorg.lists.unordered.prefix', s:palette.pink, s:palette.none)
call s:HL('@neorg.modifiers.escape', s:palette.fg, s:palette.none, 'none')
hi! link @neorg.quotes.3.content Delimiter
hi! link @neorg.quotes.3.prefix Delimiter
hi! link @neorg.quotes.4.content Blue
hi! link @neorg.quotes.4.prefix Blue
hi! link @neorg.quotes.5.content Delimiter
hi! link @neorg.quotes.5.prefix Delimiter
hi! link @neorg.quotes.6.content Blue
hi! link @neorg.quotes.6.prefix Blue
call s:HL('@neorg.todo_items.done', s:palette.green, s:palette.none)
call s:HL('@neorg.todo_items.on_hold', s:palette.brown, s:palette.none)
call s:HL('@neorg.todo_items.recurring', s:palette.cyan, s:palette.none)
call s:HL('@neorg.todo_items.uncertain', s:palette.pink, s:palette.none)
call s:HL('@neorg.todo_items.pending', s:palette.yellow, s:palette.none)
call s:HL('@neorg.todo_items.urgent', s:palette.red, s:palette.none)
hi! link @neorg.tags.ranged_verbatim.begin Comment
hi! link @neorg.tags.ranged_verbatim.name.word Comment
hi! link @neorg.tags.ranged_verbatim.end Comment
hi! link @neorg.tags.ranged_verbatim.parameters Structure
hi! link @neorg.tags.carryover.parameters @neorg.tags.ranged_verbatim.parameters
hi! link @neorg.tags.carryover.begin @neorg.tags.ranged_verbatim.begin
hi! link @neorg.tags.carryover.name.word @neorg.tags.ranged_verbatim.name.word
call s:HL('@neorg.tags.comment.content', s:palette.light_grey, s:palette.none)
call s:HL('@neorg.footnotes.title', s:palette.ash, s:palette.none, 'bold,italic')
call s:HL('@neorg.footnotes.content', s:palette.ash, s:palette.none, 'italic')
" }}}
" Neo-tree {{{
hi! link NeoTreeIndentMarker       Whitespace
hi! link NeoTreeExpander           Grey
hi! link NeoTreeRootName           Tag
hi! link NeoTreeDirectoryIcon      Directory
hi! link NeoTreeDirectoryName      Directory
hi! link NeoTreeSymbolicLinkTarget PreProc
hi! link NeoTreeFileNameOpened     Label
hi! link NeoTreeModified       Number
hi! link NeoTreeBufferNumber   Constant
hi! link NeoTreeCursorLine     CursorLine
hi! link NeoTreeDimText        NonText
hi! link NeoTreeDotfile        NonText
hi! link NeoTreeHiddenByName   NonText
hi! link NeoTreeWindowsHidden  NonText
hi! link NeoTreeGitAdded       diffAdded
hi! link NeoTreeGitDeleted     diffRemoved
hi! link NeoTreeGitModified    diffChanged
hi! link NeoTreeGitConflict    diffNewFile
hi! link NeoTreeGitIgnored     diffLine
hi! link NeoTreeGitUnstaged    diffFile
hi! link NeoTreeGitUntracked   diffFile
hi! link NeoTreeGitStaged      Function
" hi! link NeoTreeEndOfBuffer    EndOfBuffer
" }}}
" Outline {{{
hi! link OutlineFoldMarker Comment
hi! link OutlineGuides Whitespace
" }}}
" Telescope: {{{
hi! link TelescopeBorder FloatBorder
hi! link TelescopeTitle FloatTitle
call s:HL('TelescopePromptPrefix', s:palette.light_grey, s:palette.none, 'bold')
call s:HL('TelescopeMatching', s:palette.cyan, s:palette.none)
call s:HL('TelescopeSelection', s:palette.none, s:palette.select)
call s:HL('TelescopeSelectionCaret', s:palette.red, s:palette.select, 'bold')
call s:HL('TelescopeMultiSelection', s:palette.blue, s:palette.none)
call s:HL('TelescopeMultiIcon', s:palette.blue, s:palette.none)
" }}}
" junegunn/vim-plug{{{
call s:HL('plug1', s:palette.burned, s:palette.none, 'bold')
call s:HL('plugNumber', s:palette.yellow, s:palette.none, 'bold')
highlight! link plug2 Green
highlight! link plugBracket Grey
highlight! link plugName Cyan
highlight! link plugDash Burned
highlight! link plugError Red
highlight! link plugNotLoaded Grey
highlight! link plugRelDate Grey
highlight! link plugH2 Burned
highlight! link plugMessage Burned
highlight! link plugStar Red
highlight! link plugUpdate Blue
highlight! link plugDeleted Grey
highlight! link plugEdge Yellow
highlight! link plugSha Green
" }}}
" dense-analysis/ale{{{
call s:HL('ALEError', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call s:HL('ALEWarning', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('ALEInfo', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
highlight! link ALEErrorSign RedSign
highlight! link ALEWarningSign YellowSign
highlight! link ALEInfoSign BlueSign
highlight! link ALEVirtualTextError Grey
highlight! link ALEVirtualTextWarning Grey
highlight! link ALEVirtualTextInfo Grey
highlight! link ALEVirtualTextStyleError Grey
highlight! link ALEVirtualTextStyleWarning Grey
" }}}
" neomake/neomake{{{
highlight! link NeomakeError ALEError
highlight! link NeomakeErrorSign RedSign
highlight! link NeomakeWarning ALEWarning
highlight! link NeomakeWarningSign YellowSign
highlight! link NeomakeInfo ALEInfo
highlight! link NeomakeInfoSign BlueSign
highlight! link NeomakeMessage Cyan
highlight! link NeomakeMessageSign CyanSign
highlight! link NeomakeVirtualtextError Grey
highlight! link NeomakeVirtualtextWarning Grey
highlight! link NeomakeVirtualtextInfo Grey
highlight! link NeomakeVirtualtextMessag Grey
" }}}
" vim-syntastic/syntastic{{{
highlight! link SyntasticError ALEError
highlight! link SyntasticWarning ALEWarning
highlight! link SyntasticErrorSign RedSign
highlight! link SyntasticWarningSign YellowSign
" }}}
" majutsushi/tagbar{{{
highlight! link TagbarFoldIcon Green
highlight! link TagbarSignature Green
highlight! link TagbarKind Red
highlight! link TagbarScope Burned
highlight! link TagbarNestedKind Cyan
highlight! link TagbarVisibilityPrivate Red
highlight! link TagbarVisibilityPublic Blue
" }}}
" airblade/vim-gitgutter{{{
highlight! link GitGutterAdd GreenSign
highlight! link GitGutterChange BlueSign
highlight! link GitGutterDelete RedSign
highlight! link GitGutterChangeDelete blueSign
" }}}
" mhinz/vim-signify{{{
highlight! link SignifySignAdd GreenSign
highlight! link SignifySignChange BlueSign
highlight! link SignifySignDelete RedSign
highlight! link SignifySignChangeDelete blueSign
" }}}
" andymass/vim-matchup{{{
call s:HL('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call s:HL('MatchWord', s:palette.none, s:palette.none, 'underline')
call s:HL('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" justinmk/vim-sneak {{{
highlight! link Sneak Cursor
highlight! link SneakLabel Cursor
highlight! link SneakScope DiffChange
" }}}
" lewis6991/gitsigns.nvim {{{
call s:HL('GitSignsAdd', s:palette.green, s:palette.bg_darker)
call s:HL('GitSignsChange', s:palette.blue, s:palette.bg_darker)
call s:HL('GitSignsDelete', s:palette.red, s:palette.bg_darker)
hi! link GitSignsTopdelete GitSignsDelete
call s:HL('GitSignsChangedelete', s:palette.pink, s:palette.bg_darker)
call s:HL('GitSignsUntracked', s:palette.cyan, s:palette.bg_darker)
call s:HL('GitSignsAddInline', s:palette.none, s:palette.bg_green)
hi! link GitSignsChangeLnInline DiffChange
call s:HL('GitSignsDeleteInline', s:palette.none, s:palette.bg_red)
call s:HL('GitSignsAddPreview', s:palette.green, s:palette.bg_darker)
call s:HL('GitSignsDeletePreview', s:palette.red, s:palette.bg_darker)
" }}}
" ap/vim-buftabline{{{
highlight! link BufTabLineCurrent TabLineSel
highlight! link BufTabLineActive TabLine
highlight! link BufTabLineHidden TabLineFill
highlight! link BufTabLineFill TabLineFill
" }}}
" mbbill/undotree{{{
call s:HL('UndotreeSavedBig', s:palette.blue, s:palette.none, 'bold')
highlight! link UndotreeNode Burned
highlight! link UndotreeNodeCurrent Red
highlight! link UndotreeSeq Green
highlight! link UndotreeNext Blue
highlight! link UndotreeTimeStamp Grey
highlight! link UndotreeHead Yellow
highlight! link UndotreeBranch Yellow
highlight! link UndotreeCurrent Cyan
highlight! link UndotreeSavedSmall blue
" }}}
" unblevable/quick-scope {{{
call s:HL('QuickScopePrimary', s:palette.cyan, s:palette.none, 'underline')
call s:HL('QuickScopeSecondary', s:palette.blue, s:palette.none, 'underline')
" }}}
" APZelos/blamer.nvim {{{
highlight! link Blamer Grey
" }}}
" Indent blankline {{{
call s:HL('IndentBlanklineContextChar', s:palette.light_grey, s:palette.none, 'nocombine')
call s:HL('IndentBlanklineContextStart', s:palette.none, s:palette.none, 'underline', s:palette.light_grey)
" }}}
" Illuminate {{{
call s:HL('IlluminatedWordText', s:palette.none, s:palette.illuminate, 'none')
call s:HL('IlluminatedWordRead', s:palette.none, s:palette.illuminate, 'none')
call s:HL('IlluminatedWordWrite', s:palette.none, s:palette.illuminate, 'none')
" }}}
" Marks {{{
call s:HL('MarkSignHL', s:palette.burned, s:palette.bg_darker, 'bold')
hi! link MarkSignNumHL LineNr
hi! link MarkVirtTextHL DiagnosticHint
" }}}
" Pounce {{{
call s:HL('PounceMatch', s:palette.light_blue, s:palette.none)
call s:HL('PounceUnmatched', s:palette.light_grey, s:palette.none)
call s:HL('PounceGap', s:palette.light_grey, s:palette.none, 'underline', s:palette.brown)
call s:HL('PounceAccept', s:palette.bg_base, s:palette.light_red)
call s:HL('PounceAcceptBest', s:palette.bg_base, s:palette.light_red)
" }}}
" nvim-notify {{{
hi! link NotifyERRORBorder FloatBorder
hi! link NotifyWARNBorder FloatBorder
hi! link NotifyINFOBorder FloatBorder
hi! link NotifyDEBUGBorder FloatBorder
hi! link NotifyTRACEBorder FloatBorder
hi! link NotifyERRORIcon Exception
hi! link NotifyWARNIcon Boolean
hi! link NotifyINFOIcon Comment
hi! link NotifyDEBUGIcon Statement
hi! link NotifyTRACEIcon Function
hi! link NotifyERRORTitle Exception
hi! link NotifyWARNTitle Boolean
hi! link NotifyINFOTitle Comment
hi! link NotifyDEBUGTitle Statement
hi! link NotifyTRACETitle Function
hi! link NotifyERRORBody Normal
hi! link NotifyWARNBody Normal
hi! link NotifyINFOBody Normal
hi! link NotifyDEBUGBody Normal
hi! link NotifyTRACEBody Normal
call s:HL('NotifyFix', s:palette.none, s:palette.bg_base)
" }}}
" Noice {{{
call s:HL('NoiceMini', s:palette.fg, s:palette.bg_base)
hi! link NoiceCmdlinePopup MsgArea
hi! link NoiceConfirmBorder FloatBorder
hi! link NoicePopupBorder FloatBorder
hi! link NoicePopupmenuBorder FloatBorder
hi! link NoiceCmdlinePopupBorder FloatBorder
hi! link NoiceCmdlinePopupBorderSearch FloatBorder
hi! link NoiceCmdlinePopupTitle FloatTitle
call s:HL('NoiceCmdlineIcon', s:palette.green, s:palette.none)
hi! link NoiceCmdlineIconLua Number
hi! link NoiceCmdlinePrompt Statement
call s:HL('NoiceVirtualText', s:palette.search, s:palette.none, 'italic')
" }}}
" Dashboard {{{
call s:HL('DashboardProjectTitle', s:palette.orange, s:palette.none)
call s:HL('DashboardMruTitle', s:palette.orange, s:palette.none)
hi! link DashboardShortCut Exception
hi! link DashboardFooter Comment
" }}}
" Trouble {{{
hi! link TroubleIndentFoldClosed Comment
hi! link TroubleIndentFoldOpen Comment
" }}}
call s:HL('InclineNormal', s:palette.fg, s:palette.bg_dark)
call s:HL('InclineNormalNC', s:palette.light_grey, s:palette.bg_dark)
call s:HL('MiniIndentscopeSymbol', s:palette.focusindent, s:palette.none)
hi! link WhichKey Statement
hi! link WhichKeyGroup Function
hi! link WhichKeyTitle FloatBorder
" }}}

" Terminal: {{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
    " Definition
    let s:terminal = {
        \ 'black':    s:palette.fg,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.blue,
        \ 'blue':     s:palette.cyan,
        \ 'pink':   s:palette.pink,
        \ 'white':    s:palette.grey
        \ }
  " Implementation: {{{
  if !has('nvim')
      let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
                  \ s:terminal.blue[0], s:terminal.blue[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
                  \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.blue[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
      let g:terminal_color_0 = s:terminal.black[0]
      let g:terminal_color_1 = s:terminal.red[0]
      let g:terminal_color_2 = s:terminal.green[0]
      let g:terminal_color_3 = s:terminal.yellow[0]
      let g:terminal_color_4 = s:terminal.blue[0]
      let g:terminal_color_5 = s:terminal.blue[0]
      let g:terminal_color_6 = s:terminal.cyan[0]
      let g:terminal_color_7 = s:terminal.white[0]
      let g:terminal_color_8 = s:terminal.black[0]
      let g:terminal_color_9 = s:terminal.red[0]
      let g:terminal_color_10 = s:terminal.green[0]
      let g:terminal_color_11 = s:terminal.yellow[0]
      let g:terminal_color_12 = s:terminal.blue[0]
      let g:terminal_color_13 = s:terminal.blue[0]
      let g:terminal_color_14 = s:terminal.cyan[0]
      let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

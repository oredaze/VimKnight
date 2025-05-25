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
    hi clear
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
    \ 'fg':           ['#d9c9aa',   '223',  'White'],
    \ 'fg_dim':       ['#B3A994',   '214',  'Gray'],
    \ 'fg_nc':        ['#8C8369',   '214',  'Gray'],
    \ 'cream':        ['#D5C095',   '223',  'White'],
    \ 'ash':          ['#8C8C8C',   '223',  'LightGrey'],
    \ 'red':          ['#e05e52',   '167',  'Red'],
    \ 'light_red':    ['#F98080',   '167',  'Red'],
    \ 'burned':       ['#C28765',   '208',  'Red'],
    \ 'moss':         ['#BDA271',   '208',  'Red'],
    \ 'orange':       ['#db7551',   '175',  'blue'],
    \ 'yellow':       ['#F2BC7E',   '214',  'Yellow'],
    \ 'green':        ['#AAD188',   '108',  'Green'],
    \ 'cyan':         ['#99CCBB',   '108',  'Cyan'],
    \ 'cyan_dim':     ['#89B8A8',   '108',  'Cyan'],
    \ 'blue':         ['#96AED6',   '109',  'Blue'],
    \ 'pink':         ['#DBA2BF',   '175',  'blue'],
    \ 'purple':       ['#AE99CC',   '175',  'blue'],
    \ 'light_blue':   ['#FFC9C9',   '175',  'brown'],
    \ 'light_grey':   ['#73655B',   '237',  'DarkGrey'],
    \ 'grey':         ['#544C46',   '245',  'Grey'],
    \ 'dark_grey':    ['#302E2D',   '245',  'LightGrey'],
    \ 'search':       ['#CCA974',   '245',  'LightGrey'],
    \ 'select':       ['#354041',   '214',  'DarkGrey'],
    \ 'dred':         ['#A6524B',   '167',  'Red'],
    \ 'dburned':      ['#997257',   '208',  'Red'],
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
                    \ 'hi', a:group,
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
                    \ 'hi', a:group,
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
call s:HL('Directory', s:palette.cyan_dim, s:palette.none, 'bold')
call s:HL('ErrorMsg', s:palette.red, s:palette.bg_dark)
call s:HL('WarningMsg', s:palette.yellow, s:palette.bg_dark)
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
call s:HL('StatusLine', s:palette.fg_dim, s:palette.bg_dark)
call s:HL('StatusLineTerm', s:palette.fg_dim, s:palette.bg_dark)
call s:HL('StatusLineNC', s:palette.fg_nc, s:palette.bg_dark)
call s:HL('StatusLineTermNC', s:palette.fg_nc, s:palette.bg_dark)
call s:HL('TabLineSel', s:palette.cream, s:palette.bg_base)
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
call s:HL('PreProc', s:palette.yellow, s:palette.none)
call s:HL('PreCondit', s:palette.yellow, s:palette.none)
call s:HL('Include', s:palette.yellow, s:palette.none)
call s:HL('Define', s:palette.yellow, s:palette.none)
call s:HL('Conditional', s:palette.orange, s:palette.none)
call s:HL('Repeat', s:palette.orange, s:palette.none)
call s:HL('Keyword', s:palette.orange, s:palette.none)
call s:HL('Exception', s:palette.red, s:palette.none, 'bold')
call s:HL('Statement', s:palette.orange, s:palette.none)
call s:HL('Type', s:palette.cyan, s:palette.none, 'italic')
call s:HL('StorageClass', s:palette.cyan, s:palette.none, 'italic')
call s:HL('Structure', s:palette.cyan, s:palette.none)
call s:HL('Typedef', s:palette.cyan, s:palette.none, 'bold')
call s:HL('Title', s:palette.orange, s:palette.none, 'bold')
call s:HL('Character', s:palette.purple, s:palette.none, 'bold')
call s:HL('Macro', s:palette.green, s:palette.none, 'bold,italic')
call s:HL('Error', s:palette.red, s:palette.none)
call s:HL('Tag', s:palette.burned, s:palette.none, 'bold')
call s:HL('Label', s:palette.red, s:palette.none)
call s:HL('Operator', s:palette.yellow, s:palette.none)
call s:HL('Special', s:palette.purple, s:palette.none)
call s:HL('SpecialChar', s:palette.purple, s:palette.none, 'bold')
call s:HL('Identifier', s:palette.fg, s:palette.none)
call s:HL('SpecialKey', s:palette.blue, s:palette.none)
call s:HL('String', s:palette.moss, s:palette.none, 'italic')
call s:HL('Comment', s:palette.light_grey, s:palette.none, 'italic')
call s:HL('SpecialComment', s:palette.light_grey, s:palette.none, 'italic')
call s:HL('Todo', s:palette.pink, s:palette.bg_gray, 'italic')
call s:HL('Delimiter', s:palette.ash, s:palette.none)
call s:HL('Ignore', s:palette.grey, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline', s:palette.cyan)
" }}}
" Predefined hi Groups: {{{
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
call s:HL('Moss', s:palette.moss, s:palette.none)
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
call s:HL('markdownH1', s:palette.orange, s:palette.none, 'bold')
call s:HL('markdownH2', s:palette.yellow, s:palette.none, 'bold')
call s:HL('markdownH3', s:palette.burned, s:palette.none, 'bold')
call s:HL('markdownH4', s:palette.burned, s:palette.none, 'bold')
call s:HL('markdownH5', s:palette.burned, s:palette.none, 'bold')
call s:HL('markdownH6', s:palette.burned, s:palette.none, 'bold')
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
hi! link mkdCodeDelimiter Green
hi! link mkdBold Grey
hi! link mkdLink Blue
hi! link mkdHeading Grey
hi! link mkdListItem Pink
hi! link mkdRule Grey
hi! link mkdDelimiter Grey
hi! link mkdId Yellow
" }}}
" }}}
" LaTex: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_TEX{{{
hi! link texStatement Green
hi! link texOnlyMath Grey
hi! link texDefName Yellow
hi! link texNewCmd Burned
hi! link texCmdName Blue
hi! link texBeginEnd Red
hi! link texBeginEndName Blue
hi! link texDocType blue
hi! link texDocTypeArgs Burned
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
call s:HL('htmlLink', s:palette.burned, s:palette.none, 'underline')
call s:HL('htmlBold', s:palette.none, s:palette.none, 'bold')
call s:HL('htmlBoldUnderline', s:palette.none, s:palette.none, 'bold,underline')
call s:HL('htmlBoldItalic', s:palette.none, s:palette.none, 'bold,italic')
call s:HL('htmlBoldUnderlineItalic', s:palette.none, s:palette.none, 'bold,underline,italic')
call s:HL('htmlUnderline', s:palette.none, s:palette.none, 'underline')
call s:HL('htmlUnderlineItalic', s:palette.none, s:palette.none, 'underline,italic')
call s:HL('htmlItalic', s:palette.none, s:palette.none, 'italic')
call s:HL('htmlTag', s:palette.light_grey, s:palette.none)
call s:HL('htmlTagN', s:palette.pink, s:palette.none)
hi! link htmlEndTag Blue
" call s:HL('htmlTagName', s:palette.green, s:palette.none)
hi! link htmlArg Cyan
hi! link htmlScriptTag blue
hi! link htmlSpecialTagName RedItalic
" }}}
" }}}
" Xml: {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin{{{
hi! link xmlTag Green
hi! link xmlEndTag Blue
hi! link xmlTagName burnedItalic
hi! link xmlEqual Burned
hi! link xmlAttrib Cyan
hi! link xmlEntity Red
hi! link xmlEntityPunct Red
hi! link xmlDocTypeDecl Grey
hi! link xmlDocTypeKeyword blueItalic
hi! link xmlCdataStart Grey
hi! link xmlCdataCdata blue
" }}}
" }}}
" CSS: {{{
" builtin: https://github.com/JulesWang/css.vim{{{
hi! link cssAttrComma Fg
hi! link cssBraces Fg
hi! link cssTagName blueItalic
hi! link cssClassNameDot Red
hi! link cssClassName RedItalic
hi! link cssFunctionName Yellow
hi! link cssAttr Burned
hi! link cssProp Cyan
hi! link cssCommonAttr Yellow
hi! link cssPseudoClassId Blue
hi! link cssPseudoClassFn Green
hi! link cssPseudoClass blue
hi! link cssImportant RedItalic
hi! link cssSelectorOp Burned
hi! link cssSelectorOp2 Burned
hi! link cssColor Green
hi! link cssAttributeSelector Cyan
hi! link cssUnitDecorators Burned
hi! link cssValueLength Green
hi! link cssValueInteger Green
hi! link cssValueNumber Green
hi! link cssValueAngle Green
hi! link cssValueTime Green
hi! link cssValueFrequency Green
hi! link cssVendor Grey
hi! link cssNoise Grey
" }}}
" }}}
" LESS: {{{
" vim-less: https://github.com/groenewege/vim-less{{{
hi! link lessMixinChar Grey
hi! link lessClass RedItalic
hi! link lessVariable Blue
hi! link lessAmpersandChar Burned
hi! link lessFunction Yellow
" }}}
" }}}
" JavaScript: {{{
" builtin: http://www.fleiner.com/vim/syntax/javascript.vim{{{
hi! link javaScriptNull Cyan
hi! link javaScriptIdentifier Burned
hi! link javaScriptParens Fg
hi! link javaScriptBraces Fg
hi! link javaScriptGlobal blue
hi! link javaScriptMessage Yellow
hi! link javaScriptFunction RedItalic
hi! link javaScriptOperator Burned
hi! link javaScriptMember Cyan
" }}}
" vim-javascript: https://github.com/pangloss/vim-javascript{{{
hi! link jsThis blue
hi! link jsUndefined Cyan
hi! link jsNull Cyan
hi! link jsNan Cyan
hi! link jsSuper blue
hi! link jsPrototype blue
hi! link jsFunction RedItalic
hi! link jsGlobalNodeObjects blueItalic
hi! link jsGlobalObjects Yellow
hi! link jsArrowFunction blue
hi! link jsArrowFuncArgs Blue
hi! link jsFuncArgs Blue
hi! link jsObjectProp Cyan
hi! link jsVariableDef Blue
hi! link jsObjectKey Cyan
hi! link jsParen Blue
hi! link jsParenIfElse Blue
hi! link jsParenRepeat Blue
hi! link jsParenSwitch Blue
hi! link jsParenCatch Blue
hi! link jsBracket Blue
hi! link jsBlockLabel Cyan
hi! link jsFunctionKey Green
hi! link jsClassDefinition Yellow
hi! link jsDot Grey
hi! link jsDestructuringBlock Blue
hi! link jsSpreadExpression blue
hi! link jsSpreadOperator Green
hi! link jsModuleKeyword Yellow
hi! link jsObjectValue Blue
hi! link jsbrownlateExpression LightGray
hi! link jsbrownlateBraces Yellow
hi! link jsClassMethodType Burned
" }}}
" yajs: https://github.com/othree/yajs.vim{{{
hi! link javascriptEndColons Fg
hi! link javascriptOpSymbol Burned
hi! link javascriptOpSymbols Burned
hi! link javascriptIdentifierName Blue
hi! link javascriptVariable Burned
hi! link javascriptObjectLabel Cyan
hi! link javascriptObjectLabelColon Grey
hi! link javascriptPropertyNameString Cyan
hi! link javascriptFuncArg Blue
hi! link javascriptIdentifier blue
hi! link javascriptArrowFunc blue
hi! link javascriptbrownlate Yellow
hi! link javascriptbrownlateSubstitution Yellow
hi! link javascriptbrownlateSB Yellow
hi! link javascriptNodeGlobal blueItalic
hi! link javascriptDocTags blueItalic
hi! link javascriptDocNotation blue
hi! link javascriptClassSuper blue
hi! link javascriptClassName Yellow
hi! link javascriptClassSuperName Yellow
hi! link javascriptBrackets Fg
hi! link javascriptBraces Fg
hi! link javascriptLabel blue
hi! link javascriptDotNotation Grey
hi! link javascriptGlobalArrayDot Grey
hi! link javascriptGlobalBigIntDot Grey
hi! link javascriptGlobalDateDot Grey
hi! link javascriptGlobalJSONDot Grey
hi! link javascriptGlobalMathDot Grey
hi! link javascriptGlobalNumberDot Grey
hi! link javascriptGlobalObjectDot Grey
hi! link javascriptGlobalPromiseDot Grey
hi! link javascriptGlobalRegExpDot Grey
hi! link javascriptGlobalStringDot Grey
hi! link javascriptGlobalSymbolDot Grey
hi! link javascriptGlobalURLDot Grey
hi! link javascriptMethod Green
hi! link javascriptMethodName Green
hi! link javascriptObjectMethodName Green
hi! link javascriptGlobalMethod Green
hi! link javascriptDOMStorageMethod Green
hi! link javascriptFileMethod Green
hi! link javascriptFileReaderMethod Green
hi! link javascriptFileListMethod Green
hi! link javascriptBlobMethod Green
hi! link javascriptURLStaticMethod Green
hi! link javascriptNumberStaticMethod Green
hi! link javascriptNumberMethod Green
hi! link javascriptDOMNodeMethod Green
hi! link javascriptES6BigIntStaticMethod Green
hi! link javascriptBOMWindowMethod Green
hi! link javascriptHeadersMethod Green
hi! link javascriptRequestMethod Green
hi! link javascriptResponseMethod Green
hi! link javascriptES6SetMethod Green
hi! link javascriptReflectMethod Green
hi! link javascriptPaymentMethod Green
hi! link javascriptPaymentResponseMethod Green
hi! link javascriptTypedArrayStaticMethod Green
hi! link javascriptGeolocationMethod Green
hi! link javascriptES6MapMethod Green
hi! link javascriptServiceWorkerMethod Green
hi! link javascriptCacheMethod Green
hi! link javascriptFunctionMethod Green
hi! link javascriptXHRMethod Green
hi! link javascriptBOMNavigatorMethod Green
hi! link javascriptServiceWorkerMethod Green
hi! link javascriptDOMEventTargetMethod Green
hi! link javascriptDOMEventMethod Green
hi! link javascriptIntlMethod Green
hi! link javascriptDOMDocMethod Green
hi! link javascriptStringStaticMethod Green
hi! link javascriptStringMethod Green
hi! link javascriptSymbolStaticMethod Green
hi! link javascriptRegExpMethod Green
hi! link javascriptObjectStaticMethod Green
hi! link javascriptObjectMethod Green
hi! link javascriptBOMLocationMethod Green
hi! link javascriptJSONStaticMethod Green
hi! link javascriptGeneratorMethod Green
hi! link javascriptEncodingMethod Green
hi! link javascriptPromiseStaticMethod Green
hi! link javascriptPromiseMethod Green
hi! link javascriptBOMHistoryMethod Green
hi! link javascriptDOMFormMethod Green
hi! link javascriptClipboardMethod Green
hi! link javascriptTypedArrayStaticMethod Green
hi! link javascriptBroadcastMethod Green
hi! link javascriptDateStaticMethod Green
hi! link javascriptDateMethod Green
hi! link javascriptConsoleMethod Green
hi! link javascriptArrayStaticMethod Green
hi! link javascriptArrayMethod Green
hi! link javascriptMathStaticMethod Green
hi! link javascriptSubtleCryptoMethod Green
hi! link javascriptCryptoMethod Green
hi! link javascriptProp Cyan
hi! link javascriptBOMWindowProp Cyan
hi! link javascriptDOMStorageProp Cyan
hi! link javascriptFileReaderProp Cyan
hi! link javascriptURLUtilsProp Cyan
hi! link javascriptNumberStaticProp Cyan
hi! link javascriptDOMNodeProp Cyan
hi! link javascriptRequestProp Cyan
hi! link javascriptResponseProp Cyan
hi! link javascriptES6SetProp Cyan
hi! link javascriptPaymentProp Cyan
hi! link javascriptPaymentResponseProp Cyan
hi! link javascriptPaymentAddressProp Cyan
hi! link javascriptPaymentShippingOptionProp Cyan
hi! link javascriptTypedArrayStaticProp Cyan
hi! link javascriptServiceWorkerProp Cyan
hi! link javascriptES6MapProp Cyan
hi! link javascriptRegExpStaticProp Cyan
hi! link javascriptRegExpProp Cyan
hi! link javascriptXHRProp Cyan
hi! link javascriptBOMNavigatorProp Green
hi! link javascriptDOMEventProp Cyan
hi! link javascriptBOMNetworkProp Cyan
hi! link javascriptDOMDocProp Cyan
hi! link javascriptSymbolStaticProp Cyan
hi! link javascriptSymbolProp Cyan
hi! link javascriptBOMLocationProp Cyan
hi! link javascriptEncodingProp Cyan
hi! link javascriptCryptoProp Cyan
hi! link javascriptBOMHistoryProp Cyan
hi! link javascriptDOMFormProp Cyan
hi! link javascriptDataViewProp Cyan
hi! link javascriptBroadcastProp Cyan
hi! link javascriptMathStaticProp Cyan
" }}}
" }}}
" JavaScript React: {{{
" vim-jsx-pretty: https://github.com/maxmellon/vim-jsx-pretty{{{
hi! link jsxTagName burnedItalic
hi! link jsxOpenPunct Green
hi! link jsxClosePunct Blue
hi! link jsxEscapeJs Blue
hi! link jsxAttrib Cyan
" }}}
" }}}
" TypeScript: {{{
" vim-typescript: https://github.com/leafgarland/typescript-vim{{{
hi! link typescriptSource blueItalic
hi! link typescriptMessage Yellow
hi! link typescriptGlobalObjects Cyan
hi! link typescriptInterpolation Yellow
hi! link typescriptInterpolationDelimiter Yellow
hi! link typescriptBraces Fg
hi! link typescriptParens Fg
" }}}
" yats: https:github.com/HerringtonDarkholme/yats.vim{{{
hi! link typescriptMethodAccessor burnedItalic
hi! link typescriptVariable Burned
hi! link typescriptVariableDeclaration Blue
hi! link typescriptTypeReference Yellow
hi! link typescriptBraces Fg
hi! link typescriptEnumKeyword RedItalic
hi! link typescriptEnum Yellow
hi! link typescriptIdentifierName Cyan
hi! link typescriptProp Cyan
hi! link typescriptCall Blue
hi! link typescriptInterfaceName Yellow
hi! link typescriptEndColons Fg
hi! link typescriptMember Cyan
hi! link typescriptMemberOptionality Burned
hi! link typescriptObjectLabel Cyan
hi! link typescriptArrowFunc blue
hi! link typescriptAbstract Burned
hi! link typescriptObjectColon Grey
hi! link typescriptTypeAnnotation Grey
hi! link typescriptAssign Burned
hi! link typescriptBinaryOp Burned
hi! link typescriptUnaryOp Burned
hi! link typescriptFuncComma Fg
hi! link typescriptClassName Yellow
hi! link typescriptClassHeritage Yellow
hi! link typescriptInterfaceHeritage Yellow
hi! link typescriptIdentifier blue
hi! link typescriptGlobal blue
hi! link typescriptOperator RedItalic
hi! link typescriptNodeGlobal blueItalic
hi! link typescriptExport blueItalic
hi! link typescriptDefaultParam Burned
hi! link typescriptImport blueItalic
hi! link typescriptTypeParameter Yellow
hi! link typescriptReadonlyModifier Burned
hi! link typescriptAccessibilityModifier Burned
hi! link typescriptAmbientDeclaration RedItalic
hi! link typescriptbrownlateSubstitution Yellow
hi! link typescriptbrownlateSB Yellow
hi! link typescriptExceptions RedItalic
hi! link typescriptCastKeyword RedItalic
hi! link typescriptOptionalMark Burned
hi! link typescriptNull Cyan
hi! link typescriptMappedIn RedItalic
hi! link typescriptFuncTypeArrow blue
hi! link typescriptTernaryOp Burned
hi! link typescriptParenExp Blue
hi! link typescriptIndexExpr Blue
hi! link typescriptDotNotation Grey
hi! link typescriptGlobalNumberDot Grey
hi! link typescriptGlobalStringDot Grey
hi! link typescriptGlobalArrayDot Grey
hi! link typescriptGlobalObjectDot Grey
hi! link typescriptGlobalSymbolDot Grey
hi! link typescriptGlobalMathDot Grey
hi! link typescriptGlobalDateDot Grey
hi! link typescriptGlobalJSONDot Grey
hi! link typescriptGlobalRegExpDot Grey
hi! link typescriptGlobalPromiseDot Grey
hi! link typescriptGlobalURLDot Grey
hi! link typescriptGlobalMethod Green
hi! link typescriptDOMStorageMethod Green
hi! link typescriptFileMethod Green
hi! link typescriptFileReaderMethod Green
hi! link typescriptFileListMethod Green
hi! link typescriptBlobMethod Green
hi! link typescriptURLStaticMethod Green
hi! link typescriptNumberStaticMethod Green
hi! link typescriptNumberMethod Green
hi! link typescriptDOMNodeMethod Green
hi! link typescriptPaymentMethod Green
hi! link typescriptPaymentResponseMethod Green
hi! link typescriptHeadersMethod Green
hi! link typescriptRequestMethod Green
hi! link typescriptResponseMethod Green
hi! link typescriptES6SetMethod Green
hi! link typescriptReflectMethod Green
hi! link typescriptBOMWindowMethod Green
hi! link typescriptGeolocationMethod Green
hi! link typescriptServiceWorkerMethod Green
hi! link typescriptCacheMethod Green
hi! link typescriptES6MapMethod Green
hi! link typescriptFunctionMethod Green
hi! link typescriptRegExpMethod Green
hi! link typescriptXHRMethod Green
hi! link typescriptBOMNavigatorMethod Green
hi! link typescriptServiceWorkerMethod Green
hi! link typescriptIntlMethod Green
hi! link typescriptDOMEventTargetMethod Green
hi! link typescriptDOMEventMethod Green
hi! link typescriptDOMDocMethod Green
hi! link typescriptStringStaticMethod Green
hi! link typescriptStringMethod Green
hi! link typescriptSymbolStaticMethod Green
hi! link typescriptObjectStaticMethod Green
hi! link typescriptObjectMethod Green
hi! link typescriptJSONStaticMethod Green
hi! link typescriptEncodingMethod Green
hi! link typescriptBOMLocationMethod Green
hi! link typescriptPromiseStaticMethod Green
hi! link typescriptPromiseMethod Green
hi! link typescriptSubtleCryptoMethod Green
hi! link typescriptCryptoMethod Green
hi! link typescriptBOMHistoryMethod Green
hi! link typescriptDOMFormMethod Green
hi! link typescriptConsoleMethod Green
hi! link typescriptDateStaticMethod Green
hi! link typescriptDateMethod Green
hi! link typescriptArrayStaticMethod Green
hi! link typescriptArrayMethod Green
hi! link typescriptMathStaticMethod Green
hi! link typescriptStringProperty Cyan
hi! link typescriptDOMStorageProp Cyan
hi! link typescriptFileReaderProp Cyan
hi! link typescriptURLUtilsProp Cyan
hi! link typescriptNumberStaticProp Cyan
hi! link typescriptDOMNodeProp Cyan
hi! link typescriptBOMWindowProp Cyan
hi! link typescriptRequestProp Cyan
hi! link typescriptResponseProp Cyan
hi! link typescriptPaymentProp Cyan
hi! link typescriptPaymentResponseProp Cyan
hi! link typescriptPaymentAddressProp Cyan
hi! link typescriptPaymentShippingOptionProp Cyan
hi! link typescriptES6SetProp Cyan
hi! link typescriptServiceWorkerProp Cyan
hi! link typescriptES6MapProp Cyan
hi! link typescriptRegExpStaticProp Cyan
hi! link typescriptRegExpProp Cyan
hi! link typescriptBOMNavigatorProp Green
hi! link typescriptXHRProp Cyan
hi! link typescriptDOMEventProp Cyan
hi! link typescriptDOMDocProp Cyan
hi! link typescriptBOMNetworkProp Cyan
hi! link typescriptSymbolStaticProp Cyan
hi! link typescriptEncodingProp Cyan
hi! link typescriptBOMLocationProp Cyan
hi! link typescriptCryptoProp Cyan
hi! link typescriptDOMFormProp Cyan
hi! link typescriptBOMHistoryProp Cyan
hi! link typescriptMathStaticProp Cyan
" }}}
" }}}
" C/C++: {{{
" vim-cpp-enhanced-hi: https://github.com/octol/vim-cpp-enhanced-hi{{{
hi! link cppSTLnamespace blue
hi! link cppSTLtype Yellow
hi! link cppAccess blueItalic
hi! link cppStructure RedItalic
hi! link cppSTLios Cyan
hi! link cppSTLiterator blueItalic
hi! link cppSTLexception blue
" }}}
" vim-cpp-modern: https://github.com/bfrg/vim-cpp-modern{{{
hi! link cppSTLVariable Cyan
" }}}
" }}}
" C#: {{{
" builtin: https://github.com/nickspoons/vim-cs{{{
hi! link csUnspecifiedStatement blueItalic
hi! link csStorage RedItalic
hi! link csClass RedItalic
hi! link csNewType Cyan
hi! link csContextualStatement blueItalic
hi! link csInterpolationDelimiter Yellow
hi! link csInterpolation Yellow
hi! link csEndColon Fg
" }}}
" }}}
" Python: {{{
" builtin: {{{
hi! link pythonBuiltin Yellow
hi! link pythonExceptions blue
hi! link pythonDecoratorName Blue
" }}}
" python-syntax: https://github.com/vim-python/python-syntax{{{
hi! link pythonExClass blue
hi! link pythonBuiltinType Yellow
hi! link pythonBuiltinObj Blue
hi! link pythonDottedName blueItalic
hi! link pythonBuiltinFunc Green
hi! link pythonFunction Cyan
hi! link pythonDecorator Burned
hi! link pythonInclude Include
hi! link pythonImport PreProc
hi! link pythonRun Blue
hi! link pythonCoding Grey
hi! link pythonOperator Burned
hi! link pythonConditional RedItalic
hi! link pythonRepeat RedItalic
hi! link pythonException RedItalic
hi! link pythonNone Cyan
hi! link pythonDot Grey
" }}}
" }}}
" Lua: {{{
" builtin: {{{
hi! link luaFunc Green
hi! link luaFunction Green
hi! link luaTable Fg
hi! link luaIn RedItalic
" }}}
" vim-lua: https://github.com/tbastos/vim-lua{{{
hi! link luaFuncCall Green
hi! link luaLocal Burned
hi! link luaSpecialValue Green
hi! link luaBraces Fg
hi! link luaBuiltIn blue
hi! link luaNoise Grey
hi! link luaLabel blue
hi! link luaFuncTable Yellow
hi! link luaFuncArgName Blue
hi! link luaEllipsis Burned
hi! link luaDocTag Green
" }}}
" }}}
" Moonscript: {{{
" moonscript-vim: https://github.com/leafo/moonscript-vim{{{
hi! link moonInterpDelim Yellow
hi! link moonInterp Blue
hi! link moonFunction Green
hi! link moonLuaFunc Cyan
hi! link moonSpecialVar blue
hi! link moonObject Yellow
hi! link moonDotAccess Grey
" }}}
" }}}
" Kotlin: {{{
" kotlin-vim: https://github.com/udalov/kotlin-vim{{{
hi! link ktSimpleInterpolation Yellow
hi! link ktComplexInterpolation Yellow
hi! link ktComplexInterpolationBrace Yellow
hi! link ktStructure RedItalic
hi! link ktKeyword Cyan
" }}}
" }}}
" Go: {{{
" builtin: https://github.com/google/vim-ft-go{{{
hi! link goDirective blueItalic
hi! link goConstants Cyan
hi! link goDeclType burnedItalic
" }}}
" polyglot: {{{
hi! link goPackage blueItalic
hi! link goImport blueItalic
hi! link goVarArgs Blue
hi! link goBuiltins Green
hi! link goPredefinedIdentifiers Cyan
hi! link goVar Burned
" }}}
" }}}
" GDScript:: {{{
hi! link gdscriptOperator Operator
hi! link gdscriptBlockStart Statement
hi! link gdscriptNode Structure
" }}}
" PHP: {{{
" builtin: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD{{{
hi! link phpVarSelector Blue
hi! link phpDefine burnedItalic
hi! link phpStructure RedItalic
hi! link phpSpecialFunction Green
hi! link phpInterpSimpleCurly Yellow
hi! link phpComparison Burned
hi! link phpMethodsVar Cyan
hi! link phpMemberSelector Green
" }}}
" php.vim: https://github.com/StanAngeloff/php.vim{{{
hi! link phpParent Fg
hi! link phpNowDoc Green
hi! link phpFunction Green
hi! link phpMethod Green
hi! link phpClass Burned
hi! link phpSuperglobals blue
" }}}
" }}}
" Ruby: {{{
" builtin: https://github.com/vim-ruby/vim-ruby{{{
hi! link rubyKeywordAsMethod Green
hi! link rubyInterpolation Yellow
hi! link rubyInterpolationDelimiter Yellow
hi! link rubyStringDelimiter Green
hi! link rubyBlockParameterList Blue
hi! link rubyDefine RedItalic
hi! link rubyModuleName blue
hi! link rubyAccess Burned
hi! link rubyAttribute Yellow
hi! link rubyMacro RedItalic
" }}}
" }}}
" Rust: {{{
" builtin: https://github.com/rust-lang/rust.vim {{{
hi! link rustModPath Identifier
hi! link rustSelf Type
hi! link rustSigil Exception
hi! link rustMacroVariable Identifier
hi! link rustPanic Red
" }}}
" }}}
" Haskell: {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim{{{
hi! link haskellBrackets Blue
hi! link haskellIdentifier Yellow
hi! link haskellAssocType Cyan
hi! link haskellQuotedType Cyan
hi! link haskellType Cyan
hi! link haskellDeclKeyword RedItalic
hi! link haskellWhere RedItalic
hi! link haskellDeriving blueItalic
hi! link haskellForeignKeywords blueItalic
" }}}
" }}}
" Perl: {{{
" builtin: https://github.com/vim-perl/vim-perl{{{
hi! link perlStatementPackage blueItalic
hi! link perlStatementInclude blueItalic
hi! link perlStatementStorage Burned
hi! link perlStatementList Burned
hi! link perlMatchStartEnd Burned
hi! link perlVarSimpleMemberName Cyan
hi! link perlVarSimpleMember Fg
hi! link perlMethod Green
hi! link podVerbatimLine Green
hi! link podCmdText Yellow
" }}}
" }}}
" Shell: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH{{{
hi! link shRange Fg
hi! link shTestOpr Burned
hi! link shOption Cyan
hi! link bashStatement Burned
hi! link shOperator operator
hi! link shQuote Moss
hi! link shSet Burned
hi! link shSetList Fg
hi! link shSnglCase Burned
hi! link shVariable Identifier
hi! link shVarAssign Burned
hi! link shCmdSubRegion Green
hi! link shCommandSub Burned
hi! link shFunctionOne Green
hi! link shDerefSimple Fg
hi! link shFunctionKey RedItalic
" }}}
" }}}
" Zsh: {{{
" builtin: https://github.com/chrisbra/vim-zsh{{{
hi! link zshOptStart blueItalic
hi! link zshOption Blue
hi! link zshSubst Yellow
hi! link zshFunction Green
hi! link zshDeref Blue
hi! link zshTypes Burned
hi! link zshVariableDef Blue
" }}}
" }}}
" VimL: {{{
hi! link vimLet Burned
hi! link vimFunction Green
hi! link vimIsCommand Fg
hi! link vimUserFunc Green
hi! link vimFuncName Green
hi! link vimMap blueItalic
hi! link vimNotation Cyan
hi! link vimMapLhs Green
hi! link vimMapRhs Green
hi! link vimSetEqual Yellow
hi! link vimSetSep Fg
hi! link vimOption Cyan
hi! link vimUserAttrbKey Yellow
hi! link vimUserAttrb Green
hi! link vimAutoCmdSfxList Cyan
hi! link vimSynType Burned
hi! link vimHiBang Burned
hi! link vimSet Yellow
hi! link vimSetSep Grey
" }}}
" Json: {{{
hi! link jsonKeyword Burned
hi! link jsonQuote Grey
hi! link jsonBraces Fg
" }}}
" Hjson: https://github.com/hjson/vim-hjson {{{
hi! link hjsonString String
hi! link hjsonQuote String
hi! link hjsonStringUQ Fg
hi! link hjsonKeyword Keyword
hi! link hjsonBraces Fg
" }}}
" Yaml: {{{
hi! link yamlKey Burned
hi! link yamlConstant blue
" }}}
" Toml: https://github.com/cespare/vim-toml {{{
call s:HL('tomlTable', s:palette.red, s:palette.none, 'bold')
hi! link tomlKey White
call s:HL('tomlString', s:palette.cyan, s:palette.none, 'italic')
hi! link tomlBoolean Cyan
hi! link tomlTableArray tomlTable
" }}}
" Diff: {{{
" hi! link diffAdded Green
" hi! link diffRemoved Red
" hi! link diffChanged Pink
" hi! link diffOldFile Yellow
" hi! link diffNewFile Burned
" hi! link diffFile Cyan
" hi! link diffLine Grey
" hi! link diffIndexLine Blue
" }}}
" Help: {{{
call s:HL('helpNote', s:palette.blue, s:palette.none, 'bold')
call s:HL('helpHeadline', s:palette.red, s:palette.none, 'bold')
call s:HL('helpHeader', s:palette.burned, s:palette.none, 'bold')
call s:HL('helpURL', s:palette.green, s:palette.none, 'underline')
call s:HL('helpHyperTextEntry', s:palette.yellow, s:palette.none, 'bold')
hi! link helpHyperTextJump Yellow
hi! link helpCommand Cyan
hi! link helpExample Green
hi! link helpSpecial Blue
hi! link helpSectionDelim Grey
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
hi! link @variable Identifier
hi! link @attribute Constant
hi! link @constant.builtin Constant
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.bracker Delimiter
hi! link @punctuation.special Delimiter
hi! link @function.builtin Function
hi! link @string.regex SpecialChar
hi! link @storageclass.lifetime Label
hi! link @keyword.return Exception
hi! link @constructor.lua Delimiter
" }}}
" blink-cmp {{{
hi! link BlinkCmpKind              Include
hi! link BlinkCmpKindText          Identifier
hi! link BlinkCmpKindFile          Identifier
hi! link BlinkCmpKindField         Identifier
hi! link BlinkCmpKindEnumMember    Identifier
hi! link BlinkCmpKindProperty      Identifier
hi! link BlinkCmpKindClass         Type
hi! link BlinkCmpKindConstant      Constant
hi! link BlinkCmpKindConstructor   Special
hi! link BlinkCmpKindCopilot       Special
hi! link BlinkCmpKindEnum          Type
hi! link BlinkCmpKindFolder        Directory
hi! link BlinkCmpKindFunction      Function
hi! link BlinkCmpKindInterface     Type
hi! link BlinkCmpKindKeyword       Keyword
hi! link BlinkCmpKindMethod        Function
hi! link BlinkCmpKindModule        Include
hi! link BlinkCmpKindOperator      Operator
hi! link BlinkCmpKindReference     String
hi! link BlinkCmpKindSnippet       Special
hi! link BlinkCmpKindStruct        Structure
hi! link BlinkCmpKindTypeParameter Identifier
hi! link BlinkCmpKindValue         String
hi! link BlinkCmpKindVariable      Identifier
" }}}

" Plugins
" Neo-tree {{{
hi! link NeoTreeIndentMarker       Whitespace
hi! link NeoTreeExpander           Grey
hi! link NeoTreeRootName           Tag
hi! link NeoTreeDirectoryIcon      Directory
hi! link NeoTreeDirectoryName      Directory
hi! link NeoTreeSymbolicLinkTarget PreProc
hi! link NeoTreeFileNameOpened     Yellow
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
call s:HL('TelescopeSelectionCaret', s:palette.red, s:palette.select)
call s:HL('TelescopeMultiSelection', s:palette.blue, s:palette.none)
call s:HL('TelescopeMultiIcon', s:palette.blue, s:palette.none)
" }}}
" junegunn/vim-plug{{{
call s:HL('plug1', s:palette.burned, s:palette.none, 'bold')
call s:HL('plugNumber', s:palette.yellow, s:palette.none, 'bold')
hi! link plug2 Green
hi! link plugBracket Grey
hi! link plugName Cyan
hi! link plugDash Burned
hi! link plugError Red
hi! link plugNotLoaded Grey
hi! link plugRelDate Grey
hi! link plugH2 Burned
hi! link plugMessage Burned
hi! link plugStar Red
hi! link plugUpdate Blue
hi! link plugDeleted Grey
hi! link plugEdge Yellow
hi! link plugSha Green
" }}}
" dense-analysis/ale{{{
call s:HL('ALEError', s:palette.none, s:palette.none, 'undercurl', s:palette.red)
call s:HL('ALEWarning', s:palette.none, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('ALEInfo', s:palette.none, s:palette.none, 'undercurl', s:palette.blue)
hi! link ALEErrorSign RedSign
hi! link ALEWarningSign YellowSign
hi! link ALEInfoSign BlueSign
hi! link ALEVirtualTextError Grey
hi! link ALEVirtualTextWarning Grey
hi! link ALEVirtualTextInfo Grey
hi! link ALEVirtualTextStyleError Grey
hi! link ALEVirtualTextStyleWarning Grey
" }}}
" vim-syntastic/syntastic{{{
hi! link SyntasticError ALEError
hi! link SyntasticWarning ALEWarning
hi! link SyntasticErrorSign RedSign
hi! link SyntasticWarningSign YellowSign
" }}}
" majutsushi/tagbar{{{
hi! link TagbarFoldIcon Green
hi! link TagbarSignature Green
hi! link TagbarKind Red
hi! link TagbarScope Burned
hi! link TagbarNestedKind Cyan
hi! link TagbarVisibilityPrivate Red
hi! link TagbarVisibilityPublic Blue
" }}}
" airblade/vim-gitgutter{{{
hi! link GitGutterAdd GreenSign
hi! link GitGutterChange BlueSign
hi! link GitGutterDelete RedSign
hi! link GitGutterChangeDelete blueSign
" }}}
" mhinz/vim-signify{{{
hi! link SignifySignAdd GreenSign
hi! link SignifySignChange BlueSign
hi! link SignifySignDelete RedSign
hi! link SignifySignChangeDelete blueSign
" }}}
" andymass/vim-matchup{{{
call s:HL('MatchParenCur', s:palette.none, s:palette.none, 'bold')
call s:HL('MatchWord', s:palette.none, s:palette.none, 'underline')
call s:HL('MatchWordCur', s:palette.none, s:palette.none, 'underline')
" }}}
" justinmk/vim-sneak {{{
hi! link Sneak Cursor
hi! link SneakLabel Cursor
hi! link SneakScope DiffChange
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
hi! link BufTabLineCurrent TabLineSel
hi! link BufTabLineActive TabLine
hi! link BufTabLineHidden TabLineFill
hi! link BufTabLineFill TabLineFill
" }}}
" mbbill/undotree{{{
call s:HL('UndotreeSavedBig', s:palette.blue, s:palette.none, 'bold')
hi! link UndotreeNode Burned
hi! link UndotreeNodeCurrent Red
hi! link UndotreeSeq Green
hi! link UndotreeNext Blue
hi! link UndotreeTimeStamp Grey
hi! link UndotreeHead Yellow
hi! link UndotreeBranch Yellow
hi! link UndotreeCurrent Cyan
hi! link UndotreeSavedSmall blue
" }}}
" Indent blankline {{{
call s:HL('IndentBlanklineContextChar', s:palette.light_grey, s:palette.none, 'nocombine')
call s:HL('IndentBlanklineContextStart', s:palette.none, s:palette.none, 'underline', s:palette.light_grey)
" }}}
" Marks {{{
call s:HL('MarkSignHL', s:palette.burned, s:palette.bg_darker, 'bold')
hi! link MarkSignNumHL LineNr
hi! link MarkVirtTextHL DiagnosticHint
" }}}
" Pounce {{{
call s:HL('PounceMatch', s:palette.light_blue, s:palette.none)
call s:HL('PounceUnmatched', s:palette.light_grey, s:palette.none)
call s:HL('PounceGap', s:palette.light_grey, s:palette.none, 'underline', s:palette.burned)
call s:HL('PounceAccept', s:palette.bg_base, s:palette.light_red)
call s:HL('PounceAcceptBest', s:palette.bg_base, s:palette.light_red)
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
" Mini.Files {{{
hi! link MiniFilesBorderModified Number
hi! link MiniFilesTitleFocused Burned
" }}}
" WhichKey {{{
hi! link WhichKey Statement
hi! link WhichKeyGroup Function
hi! link WhichKeyTitle FloatBorder
" }}}

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

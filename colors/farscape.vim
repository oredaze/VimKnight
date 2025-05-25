"   _____
" _/ ____\____ _______  ______ ____ _____  ______   ____
" \   __\\__  \\_  __ \/  ___// ___\\__  \ \____ \_/ __ \
"  |  |   / __ \|  | \/\___ \\  \___ / __ \|  |_> >  ___/
"  |__|  (____  /__|  /____  >\___  >____  /   __/ \___  >
"             \/           \/     \/     \/|__|        \/
"
" Name:         farscape
" Author:       bitraven
" Description:  The default colorscheme at the leviathan
" License:      MIT

if !(exists('g:colors_name') && g:colors_name ==# 'farscape')
	highlight clear
	if exists('syntax_on')
		syntax reset
	endif
endif

set background=dark
let g:colors_name="farscape"

hi Normal guifg=#B1B3B4 guibg=#1A1C23 guisp=NONE blend=NONE gui=NONE
hi! link TelescopeNormal Normal
hi Character guifg=#FAC199 guibg=NONE guisp=NONE blend=NONE gui=bold
hi ColorColumn guifg=NONE guibg=#432831 guisp=NONE blend=NONE gui=bold
hi Comment guifg=#696B77 guibg=NONE guisp=NONE blend=NONE gui=italic
hi! link SpecialComment Comment
hi Conceal guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Constant guifg=#FAC199 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Boolean Constant
hi Number guifg=#4AA9B0 guibg=NONE gui=NONE
hi Cursor guifg=#1A1C23 guibg=#B1B3B4 guisp=NONE blend=NONE gui=bold
hi! link CursorIM Cursor
hi! link TermCursor Cursor
hi CursorLine guifg=NONE guibg=#191A1F guisp=NONE blend=NONE gui=NONE
hi! link CursorColumn CursorLine
hi CursorLineNr guifg=#AFB0B6 guibg=#1A1C23 guisp=NONE blend=NONE gui=NONE
hi Debug guifg=#B1B3B4 guibg=#432831 guisp=NONE blend=NONE gui=NONE
hi Delimiter guifg=#8F9194 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi DiagnosticError guifg=#DE6480 guibg=NONE guisp=NONE blend=NONE gui=italic
hi DiagnosticHint guifg=#858793 guibg=NONE guisp=NONE blend=NONE gui=italic
hi DiagnosticInfo guifg=#C0BB82 guibg=NONE guisp=NONE blend=NONE gui=italic
hi DiagnosticSignError guifg=#DE6480 guibg=#121317 guisp=NONE blend=NONE gui=italic
hi DiagnosticSignHint guifg=#858793 guibg=#121317 guisp=NONE blend=NONE gui=italic
hi DiagnosticSignInfo guifg=#C0BB82 guibg=#121317 guisp=NONE blend=NONE gui=italic
hi DiagnosticSignWarn guifg=#F9A885 guibg=#121317 guisp=NONE blend=NONE gui=italic
hi DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#DE6480 blend=NONE gui=underdashed
hi DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#858793 blend=NONE gui=underdashed
hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#C0BB82 blend=NONE gui=underdashed
hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#F9A885 blend=NONE gui=underdashed
hi DiagnosticVirtualTextError guifg=#DE6480 guibg=#292A33 guisp=NONE blend=NONE gui=italic
hi DiagnosticVirtualTextHint guifg=#858793 guibg=#292A33 guisp=NONE blend=NONE gui=italic
hi DiagnosticVirtualTextInfo guifg=#C0BB82 guibg=#292A33 guisp=NONE blend=NONE gui=italic
hi DiagnosticVirtualTextWarn guifg=#F9A885 guibg=#292A33 guisp=NONE blend=NONE gui=italic
hi DiagnosticWarn guifg=#F9A885 guibg=NONE guisp=NONE blend=NONE gui=italic
hi DiffAdd guifg=#B1B3B4 guibg=#29333D guisp=NONE blend=NONE gui=NONE
hi DiffChange guifg=NONE guibg=#292A33 guisp=NONE blend=NONE gui=NONE
hi DiffDelete guifg=#60616C guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi DiffText guifg=#987BA7 guibg=#292A33 guisp=NONE blend=NONE gui=NONE
hi Directory guifg=#CC9D7D guibg=NONE guisp=NONE blend=NONE gui=bold
hi EndOfBuffer guifg=#54555F guibg=#121317 guisp=NONE blend=NONE gui=bold
hi Error guifg=#B1B3B4 guibg=#432831 guisp=NONE blend=NONE gui=NONE
hi ErrorMsg guifg=#FAC199 guibg=#432831 guisp=NONE blend=NONE gui=NONE
hi Exception guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Folded guifg=#B1B3B4 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi! link FoldColumn Folded
hi! link InclineNormalNC Folded
hi Function guifg=#DE6480 guibg=NONE guisp=NONE blend=NONE gui=italic
hi HopNextKey guifg=#DE6480 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopNextKey1 guifg=#DE6480 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopNextKey2 guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopPreview guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopUnmatched guifg=#505158 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Identifier guifg=#B1B3B4 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Ignore guifg=#B1B3B4 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi IlluminatedWordText guifg=NONE guibg=#292A33 guisp=NONE blend=NONE gui=NONE
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText
hi IncSearch guifg=#B1B3B4 guibg=#292A33 guisp=NONE blend=NONE gui=reverse
hi! link CurSearch IncSearch
hi InclineNormal guifg=#F9A885 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi! link Typedef Keyword
hi Label guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi LineNr guifg=#44454B guibg=#1A1C23 guisp=NONE blend=NONE gui=NONE
hi Macro guifg=#DE6480 guibg=NONE guisp=NONE blend=NONE gui=bold
hi MarkSignHL guifg=#E98677 guibg=#1A1C23 guisp=NONE blend=NONE gui=bold
hi! link MarkSignNumHL MarkSignHL
hi MarkVirtTextHL guifg=#696B77 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi MatchParen guifg=#DE6480 guibg=#121317 guisp=NONE blend=NONE gui=bold
hi ModeMsg guifg=#DE6480 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi MoreMsg guifg=#FAC199 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi MsgArea guifg=NONE guibg=#121317 gui=NONE
hi! link MessageWindow MoreMsg
hi! link Question MoreMsg
" Outline {{{
hi! link OutlineFoldMarker Comment
hi! link OutlineGuides Whitespace
" }}}
hi NonText guifg=#51525C guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link SpecialKey NonText
hi! link Float Number
hi Operator guifg=#C67694 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link gdscriptOperator Operator
hi NormalFloat guifg=#B1B3B4 guibg=#121317 gui=NONE
hi! link Pmenu NormalFloat
hi! link PmenuExtra Pmenu
hi! link PmenuKind Pmenu
hi PmenuSbar guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#432831 guisp=NONE blend=NONE gui=NONE
hi! link PmenuExtraSel PmenuSel
hi! link PmenuKindSel PmenuSel
hi! link PopupSelected PmenuSel
hi! link WildMenu PmenuSel
hi PmenuThumb guifg=NONE guibg=#3D3D43 guisp=NONE blend=NONE gui=NONE
hi PounceAccept guifg=#1A1C23 guibg=#DE6480 guisp=NONE blend=NONE gui=NONE
hi PounceAcceptBest guifg=#1A1C23 guibg=#DE6480 guisp=NONE blend=NONE gui=NONE
hi PounceGap guifg=#696B77 guibg=NONE guisp=#B1B3B4 blend=NONE gui=underline
hi PounceMatch guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi PounceUnmatched guifg=#696B77 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi PreCondit guifg=#987BA7 guibg=NONE guisp=NONE blend=NONE gui=bold
hi PreProc guifg=#987BA7 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Define PreProc
hi! link Include PreProc
hi Repeat guifg=#987BA7 guibg=NONE guisp=NONE blend=NONE gui=bold
hi Search guifg=#B1B3B4 guibg=#292A33 guisp=NONE blend=NONE gui=NONE
hi SignColumn guifg=NONE guibg=#1A1C23 guisp=NONE blend=NONE gui=NONE
hi Special guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi SpecialChar guifg=#E98677 guibg=NONE guisp=NONE blend=NONE gui=bold
hi SpellBad guifg=NONE guibg=NONE guisp=#E03860 blend=NONE gui=undercurl
hi SpellCap guifg=NONE guibg=NONE guisp=#A3A4AE blend=NONE gui=undercurl
hi SpellLocal guifg=NONE guibg=NONE guisp=#C0BB82 blend=NONE gui=undercurl
hi SpellRare guifg=NONE guibg=NONE guisp=#987BA7 blend=NONE gui=undercurl
hi Statement guifg=#987BA7 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Conditional Statement
hi! link Keyword Statement
hi! link gdscriptBlockStart Statement
hi StatusLine guifg=#969899 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi StatusLineNC guifg=#7B7C8A guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi StorageClass guifg=#E98677 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Structure StorageClass
hi String guifg=#F9A885 guibg=NONE guisp=NONE blend=NONE gui=italic
hi! link gdscriptNode Structure
hi TabLineSel guifg=#969899 guibg=#2E2F33 guisp=NONE blend=NONE gui=NONE
hi TabLineSelEdge guifg=#7B5B8C guibg=#0E0F12 guisp=NONE blend=NONE gui=NONE
hi TabLine guifg=#7D7F80 guibg=#202124 guisp=NONE blend=NONE gui=NONE
hi TabLineUnsel guifg=#696B77 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi TabLineFill guifg=#121317 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi Tag guifg=#FAC199 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link TelescopeBorder VertSplit
hi TelescopeMatching guifg=#987BA7 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi TelescopeMultiSelection guifg=#4AA9B0 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link TelescopeMultiIcon TelescopeMultiSelection
hi TelescopePromptPrefix guifg=#696B77 guibg=NONE guisp=NONE blend=NONE gui=bold
hi TelescopeSelectionCaret guifg=#DE6480 guibg=#3D3D43 guisp=NONE blend=NONE gui=NONE
hi TelescopeTitle guifg=#B1B3B4 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi Title guifg=#FAC199 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Todo guifg=#987BA7 guibg=#3D3D43 guisp=NONE blend=NONE gui=NONE
hi ToolbarButton guifg=#DE6480 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi ToolbarLine guifg=NONE guibg=#292A33 guisp=NONE blend=NONE gui=NONE
hi Type guifg=#E98677 guibg=NONE guisp=NONE blend=NONE gui=italic
hi Underlined guifg=#B4B3B1 guibg=NONE guisp=#8F9194 blend=NONE gui=underline
hi User1 guifg=#DE6480 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi User2 guifg=#696B77 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi VertSplit guifg=#37373D guibg=#121317 guisp=NONE blend=NONE gui=bold
hi! link FloatBorder VertSplit
hi FloatTitle guifg=#B1B3B4 guibg=#121317 guisp=NONE blend=NONE gui=NONE
hi! link Winseparator VertSplit
hi Visual guifg=#F3C3A0 guibg=#3D3D43 guisp=NONE blend=NONE gui=NONE
hi! link TelescopeSelection Visual
hi VisualNOS guifg=NONE guibg=#3D3D43 guisp=NONE blend=NONE gui=NONE
hi WarningMsg guifg=#FAC199 guibg=#3D3D43 guisp=NONE blend=NONE gui=NONE
hi! link PopupNotification WarningMsg
hi Whitespace guifg=#2B3540 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi lCursor guifg=#1A1C23 guibg=#4AA9B0 guisp=NONE blend=NONE gui=NONE

" Hjson: https://github.com/hjson/vim-hjson {{{
hi! link hjsonString String
hi! link hjsonQuote String
hi! link hjsonStringUQ Fg
hi! link hjsonKeyword Keyword
hi! link hjsonBraces Fg
" }}}

" Neo-tree {{{
hi! link NeoTreeIndentMarker       Whitespace
hi! link NeoTreeExpander           Comment
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

" Treesitter {{{
hi! link @attribute Constant
hi! link @constant.builtin Constant
hi! link @punctuation.bracket Delimiter
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.special Delimiter
hi! link @keyword.return Exception
hi! link @function.builtin Function
hi! link @storageclass.lifetime Label
hi! link @string.regex SpecialChar
hi! link @constructor.lua @punctuation.bracket
hi @variable.builtin guifg=#B1B3B4 guibg=NONE guisp=NONE blend=NONE gui=italic
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

" Markdown: {{{
" builtin: {{{
hi! link markdownH1 Statement
hi! link markdownH2 Statement
hi! link markdownH3 Statement
hi! link markdownH4 Statement
hi! link markdownH5 Statement
hi! link markdownH6 Statement
hi! link markdownUrl Underlined
hi markdownItalic guifg=NONE guibg=NONE gui=italic
hi markdownBold guifg=NONE guibg=NONE gui=bold
hi markdownCode guifg=#DE6480 guibg=NONE gui=italic
hi! link markdownItalicDelimiter Delimiter
hi! link markdownCodeDelimiter Delimiter
hi! link markdownBoldDelimiter Delimiter
hi! link markdownListMarker Special
hi! link markdownRule Comment
" }}}
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
hi! link mkdURL Underlined
hi! link mkdInlineURL Underlined
" }}}
" }}}
hi! link htmlTag Delimiter
hi! link htmlTagN Constant

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
hi! link NotifyERRORTitle  Exception
hi! link NotifyWARNTitle Boolean
hi! link NotifyINFOTitle Comment
hi! link NotifyDEBUGTitle  Statement
hi! link NotifyTRACETitle  Function
hi! link NotifyERRORBody Normal
hi! link NotifyWARNBody Normal
hi! link NotifyINFOBody Normal
hi! link NotifyDEBUGBody Normal
hi! link NotifyTRACEBody Normal
hi NotifyFix guifg=NONE guibg=#1A1C23 gui=NONE
" }}}
" Noice {{{
hi NoiceMini guifg=#B1B3B4 guibg=#1A1C23
hi! link NoiceCmdlinePopup MsgArea
hi! link NoiceConfirmBorder FloatBorder
hi! link NoicePopupBorder FloatBorder
hi! link NoicePopupmenuBorder FloatBorder
hi! link NoiceCmdlinePopupBorder FloatBorder
hi! link NoiceCmdlinePopupBorderSearch FloatBorder 
hi! link NoiceCmdlinePopupTitle FloatTitle
hi! link NoiceCmdlineIcon Function
hi! link NoiceCmdlineIconLua Number
hi! link NoiceCmdlinePrompt Statement
hi NoiceVirtualText guifg=#4AA9B0 guibg=NONE gui=italic
" }}}
" Dashboard {{{
hi! link DashboardProjectTitle Statement
hi! link DashboardMruTitle Statement
hi! link DashboardShortCut Exception
hi! link DashboardFooter Comment
" }}}
" Trouble {{{
hi! link TroubleIndentFoldClosed Comment
hi! link TroubleIndentFoldOpen Comment
" }}}
hi MiniIndentscopeSymbol guifg=#64516E guibg=NONE gui=NONE
hi! link WhichKey Number
hi! link WhichKeyGroup Function
hi! link WhichKeyTitle FloatBorder

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

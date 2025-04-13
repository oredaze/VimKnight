"                    .__ ___.
"   __________  __ __|  |\_ |__  __ _________  ____
"  /  ___/  _ \|  |  \  | | __ \|  |  \_  __ \/    \
"  \___ (  <_> )  |  /  |_| \_\ \  |  /|  | \/   |  \
" /____  >____/|____/|____/___  /____/ |__|  |___|  /
"      \/                     \/                  \/
"
" Name:         soulburn
" Author:       bitraven
" Description:  inspired by Zenburn
" License:      MIT

if !(exists('g:colors_name') && g:colors_name ==# 'soulburn')
	highlight clear
	if exists('syntax_on')
		syntax reset
	endif
endif

set background=dark
let g:colors_name="soulburn"

hi Normal guifg=#D5D2C8 guibg=#383838 guisp=NONE blend=NONE gui=NONE
hi Character guifg=#B3B474 guibg=NONE guisp=NONE blend=NONE gui=bold
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
hi ColorColumn guifg=NONE guibg=#533737 guisp=NONE blend=NONE gui=bold
hi Comment guifg=#8A8A8A guibg=NONE guisp=NONE blend=NONE gui=italic
hi! link SpecialComment Comment
hi Conceal guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Constant guifg=#91C4CA guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Boolean Constant
hi! link Number Constant
hi Cursor guifg=#383838 guibg=#D5D2C8 guisp=NONE blend=NONE gui=bold
hi! link CursorIM Cursor
hi! link TermCursor Cursor
hi CursorLine guifg=NONE guibg=#303030 guisp=NONE blend=NONE gui=NONE
hi! link CursorColumn CursorLine
hi CursorLineNr guifg=#FCB897 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi Debug guifg=#D5D2C8 guibg=#4D3D3D guisp=NONE blend=NONE gui=NONE
hi Delimiter guifg=#C0967C guibg=NONE guisp=NONE blend=NONE gui=NONE
hi DiagnosticError guifg=#CF6863 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticWarn guifg=#FCB897 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticHint guifg=#A1A1A1 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticInfo guifg=#B3B474 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticUnderlineError guifg=NONE guibg=NONE guisp=#CF6863 blend=NONE gui=underdashed
hi DiagnosticUnderlineHint guifg=NONE guibg=NONE guisp=#A1A1A1 blend=NONE gui=underdashed
hi DiagnosticUnderlineInfo guifg=NONE guibg=NONE guisp=#B3B474 blend=NONE gui=underdashed
hi DiagnosticUnderlineWarn guifg=NONE guibg=NONE guisp=#FCB897 blend=NONE gui=underdashed
hi DiagnosticVirtualTextError guifg=#CF6863 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticVirtualTextHint guifg=#A1A1A1 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticVirtualTextInfo guifg=#B3B474 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi DiagnosticVirtualTextWarn guifg=#FCB897 guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn DiagnosticWarn
hi! link DiagnosticSignInfo DiagnosticInfo
hi! link DiagnosticSignHint DiagnosticHint
hi DiffAdd guifg=#D5D2C8 guibg=#344556 guisp=NONE blend=NONE gui=NONE
hi DiffChange guifg=NONE guibg=#454545 guisp=NONE blend=NONE gui=NONE
hi DiffDelete guifg=#7D7D7D guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi DiffText guifg=#c2a4bf guibg=#454545 guisp=NONE blend=NONE gui=NONE
hi Directory guifg=#B3B474 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi EndOfBuffer guifg=#616161 guibg=#2B2B2B guisp=NONE blend=NONE gui=bold
hi Error guifg=#D5D2C8 guibg=#4D3D3D guisp=NONE blend=NONE gui=NONE
hi ErrorMsg guifg=#E8D3A6 guibg=#4D3D3D guisp=NONE blend=NONE gui=NONE
hi Exception guifg=#E69370 guibg=NONE guisp=NONE blend=NONE gui=bold
hi Folded guifg=#ABABAB guibg=#2B2B2B guisp=NONE blend=NONE gui=italic
hi! link FoldColumn Folded
hi Function guifg=#E8D3A6 guibg=NONE guisp=NONE blend=NONE gui=italic
hi HopNextKey guifg=#D1706B guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopNextKey1 guifg=#D1706B guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopNextKey2 guifg=#91C4CA guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopPreview guifg=#91C4CA guibg=NONE guisp=NONE blend=NONE gui=NONE
hi HopUnmatched guifg=#616161 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Identifier guifg=#D5D2C8 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Ignore guifg=#D5D2C8 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi IlluminatedWordText guifg=NONE guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi! link IlluminatedWordRead IlluminatedWordText
hi! link IlluminatedWordWrite IlluminatedWordText
hi IncSearch guifg=#D5D2C8 guibg=#202020 guisp=NONE blend=NONE gui=reverse
hi! link CurSearch IncSearch
hi Label guifg=#E69370 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi LineNr guifg=#616161 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi Terminal guifg=#D5D2C8 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi Macro guifg=#d38e8a guibg=NONE guisp=NONE blend=NONE gui=bold
" Marks {{{
hi MarkSignHL guifg=#CF6863 guibg=#2B2B2B gui=bold
hi! link MarkSignNumHL LineNr
hi! link MarkVirtTextHL DiagnosticHint
" }}}
hi MatchParen guifg=#CF6863 guibg=#2B2B2B guisp=NONE blend=NONE gui=bold
hi ModeMsg guifg=#8DB090 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi MsgArea guifg=NONE guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi MoreMsg guifg=#E8D3A6 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link MessageWindow MoreMsg
hi! link Question MoreMsg
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
" Outline {{{
hi! link OutlineFoldMarker Comment
hi! link OutlineGuides Whitespace
" }}}
hi NonText guifg=#6B6B6B guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link SpecialKey NonText
hi! link Float Number
hi Operator guifg=#CF6863 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link gdscriptOperator Operator
hi NormalFloat guifg=#D5D2C8 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi! link Pmenu NormalFloat
hi! link PmenuExtra NormalFloat
hi! link PmenuKind NormalFloat
hi PmenuSbar guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#523D3D gui=NONE
hi! link PmenuExtraSel PmenuSel
hi! link PmenuKindSel PmenuSel
hi! link PopupSelected PmenuSel
hi! link WildMenu PmenuSel
hi PmenuThumb guifg=NONE guibg=#8A8A8A guisp=NONE blend=NONE gui=NONE
hi PounceAccept guifg=#202020 guibg=#D1706B guisp=NONE blend=NONE gui=NONE
hi PounceAcceptBest guifg=#202020 guibg=#D1706B guisp=NONE blend=NONE gui=NONE
hi PounceGap guifg=#A3A3A3 guibg=NONE guisp=#91C4CA blend=NONE gui=underline
hi PounceMatch guifg=#91C4CA guibg=NONE guisp=NONE blend=NONE gui=NONE
hi PounceUnmatched guifg=#8a8a8a guibg=NONE guisp=NONE blend=NONE gui=NONE
hi PreCondit guifg=#FCB897 guibg=NONE guisp=NONE blend=NONE gui=bold
hi PreProc guifg=#FCB897 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Define PreProc
hi! link Include PreProc
hi Repeat guifg=#d38e8a guibg=NONE guisp=NONE blend=NONE gui=bold
hi Search guifg=#D5D2C8 guibg=#523D3D guisp=NONE blend=NONE gui=NONE
hi SignColumn guifg=NONE guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi Special guifg=#8CC0B4 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link SpecialChar Special
hi SpellBad guifg=NONE guibg=NONE guisp=#C77575 blend=NONE gui=undercurl
hi SpellCap guifg=NONE guibg=NONE guisp=#B8B8B8 blend=NONE gui=undercurl
hi SpellLocal guifg=NONE guibg=NONE guisp=#B3B474 blend=NONE gui=undercurl
hi SpellRare guifg=NONE guibg=NONE guisp=#c2a4bf blend=NONE gui=undercurl
hi Statement guifg=#d38e8a guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Conditional Statement
hi! link Keyword Statement
hi! link gdscriptBlockStart Statement
hi StatusLine guifg=#B3AFA4 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi StatusLineNC guifg=#999999 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi StorageClass guifg=#8DB090 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link Structure StorageClass
hi String guifg=#B3B474 guibg=NONE guisp=NONE blend=NONE gui=italic
hi! link gdscriptNode Structure
hi TabLineSel guifg=#B3AFA4 guibg=#523D3D guisp=NONE blend=NONE gui=NONE
hi TabLine guifg=#8A8A8A guibg=#202020 guisp=NONE blend=NONE gui=NONE
hi TabLineFill guifg=#2B2B2B guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi Tag guifg=#d38e8a guibg=NONE guisp=NONE blend=NONE gui=bold
hi Title guifg=#E8D3A6 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi Todo guifg=#c2a4bf guibg=#454545 guisp=NONE blend=NONE gui=NONE
hi ToolbarButton guifg=#d38e8a guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi ToolbarLine guifg=NONE guibg=#202020 guisp=NONE blend=NONE gui=NONE
hi Type guifg=#8DB090 guibg=NONE guisp=NONE blend=NONE gui=italic
hi Typedef guifg=#8DB090 guibg=NONE guisp=NONE blend=NONE gui=bold
hi Underlined guifg=#C8CBD5 guibg=NONE guisp=NONE blend=NONE gui=underline
hi User1 guifg=#8DB090 guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi User2 guifg=#616161 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi VertSplit guifg=#99736B guibg=NONE guisp=NONE blend=NONE gui=NONE
hi FloatBorder guifg=#99736B guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi! link FloatTitle VertSplit
hi! link Winseparator VertSplit
hi Visual guifg=NONE guibg=#202020 guisp=NONE blend=NONE gui=NONE
hi VisualNOS guifg=NONE guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi WarningMsg guifg=#E8D3A6 guibg=#454545 guisp=NONE blend=NONE gui=NONE
hi! link PopupNotification WarningMsg
hi Whitespace guifg=#4F4F4F guibg=NONE guisp=NONE blend=NONE gui=NONE
hi lCursor guifg=#383838 guibg=#91C4CA guisp=NONE blend=NONE gui=NONE
hi! link TelescopeBorder VertSplit
hi! link TelescopeNormal Normal
hi! link TelescopeTitle FloatTitle
hi TelescopeSelection guifg=NONE guibg=#2B2B2B guisp=NONE blend=NONE gui=NONE
hi TelescopeSelectionCaret guifg=#CF6863 guibg=#2B2B2B guisp=NONE blend=NONE gui=bold
hi TelescopeMatching guifg=#8DB090 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi TelescopeMultiSelection guifg=#91C4CA guibg=NONE guisp=NONE blend=NONE gui=NONE
hi! link TelescopeMultiIcon TelescopeMultiSelection
hi! link TelescopePromptPrefix VertSplit
hi! link @attribute Constant
hi! link @constant.builtin Constant
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.special Delimiter
hi! link @function.builtin Function
hi! link @string.regex SpecialChar
hi! link @constructor.lua @punctuation.bracket
hi @keyword.return guifg=#E69370 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi @punctuation.bracket guifg=#BBB6A5 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi @storageclass.lifetime guifg=#E69370 guibg=NONE guisp=NONE blend=NONE gui=NONE
hi @variable.builtin guifg=#D5D2C8 guibg=NONE guisp=NONE blend=NONE gui=italic
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
hi NotifyFix guifg=NONE guibg=#383838 gui=NONE
" }}}
" Noice {{{
hi NoiceMini guifg=#D5D2C8 guibg=#383838
hi! link NoiceCmdlinePopup MsgArea
hi! link NoiceConfirmBorder FloatBorder
hi! link NoicePopupBorder FloatBorder
hi! link NoicePopupmenuBorder FloatBorder
hi! link NoiceCmdlinePopupBorder FloatBorder
hi! link NoiceCmdlinePopupBorderSearch FloatBorder 
hi! link NoiceCmdlinePopupTitle FloatTitle
hi! link NoiceCmdlineIcon MoreMsg
hi! link NoiceCmdlineIconLua Number
hi! link NoiceCmdlinePrompt Statement
hi NoiceVirtualText guifg=#523D3D guibg=NONE gui=italic
" }}}
hi MiniIndentscopeSymbol guifg=#806059 guibg=NONE gui=NONE
" Dashboard {{{
hi DashboardProjectTitle guifg=#E8D3A6 guibg=NONE gui=NONE
hi DashboardMruTitle guifg=#E8D3A6 guibg=NONE gui=NONE
hi! link DashboardShortCut Exception
hi! link DashboardFooter Comment
" }}}
" Trouble {{{
hi! link TroubleIndentFoldClosed Comment
hi! link TroubleIndentFoldOpen Comment
" }}}
" lewis6991/gitsigns.nvim {{{
hi GitSignsAdd guifg=#8DB090 guibg=#2B2B2B gui=NONE
hi GitSignsChange guifg=#91C4CA guibg=#2B2B2B gui=NONE
hi GitSignsDelete guifg=#CF6863 guibg=#2B2B2B gui=NONE
hi GitSignsChangedelete guifg=#c2a4bf guibg=#2B2B2B gui=NONE
hi GitSignsUntracked guifg=#FCB897 guibg=#2B2B2B gui=NONE
" hi GitSignsAddInline', s:palette.none, s:palette.bg_green)
" hi GitSignsDeleteInline', s:palette.none, s:palette.bg_red)
hi! link GitSignsAddPreview GitSignsAdd
hi! link GitSignsDeletePreview GitSignsDelete
hi! link GitSignsTopdelete GitSignsDelete
hi! link GitSignsChangeLnInline DiffChange
" }}}
hi! link WhichKey Type

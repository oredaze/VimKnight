" Vim color file
"
" Name:    16monkeys
" Author:  bitraven

hi clear
if exists("syntax_on")
	syntax reset
endif
set background=dark

let g:colors_name = "16monkeys"

" Predefined Highlight Groups: {{{
hi Grey ctermfg=0 ctermbg=none cterm=bold
hi White ctermfg=7 ctermbg=none
hi Red ctermfg=1 ctermbg=none
hi Green ctermfg=2 ctermbg=none
hi Yellow ctermfg=3 ctermbg=none
hi Blue ctermfg=4 ctermbg=none
hi Purple ctermfg=5 ctermbg=none
hi Cyan ctermfg=6 ctermbg=none
hi BoldWhite ctermfg=7 ctermbg=none cterm=bold
hi BoldRed ctermfg=1 ctermbg=none cterm=bold
hi BoldGreen ctermfg=2 ctermbg=none cterm=bold
hi BoldYellow ctermfg=3 ctermbg=none cterm=bold
hi BoldBlue ctermfg=4 ctermbg=none cterm=bold
hi BoldPurple ctermfg=5 ctermbg=none cterm=bold
hi BoldCyan ctermfg=6 ctermbg=none cterm=bold
" }}}
" Syntax {{{
hi Normal ctermfg=7 ctermbg=none
hi Comment ctermfg=0 ctermbg=none cterm=bold
hi SpecialComment ctermfg=0 ctermbg=none cterm=bold
hi NonText ctermfg=0 ctermbg=none cterm=bold
hi SpecialKey ctermfg=0 ctermbg=none cterm=bold
hi Conceal ctermfg=0 ctermbg=none cterm=bold
hi Constant ctermfg=4 ctermbg=none cterm=bold
hi String ctermfg=3 ctermbg=none cterm=bold
hi Character ctermfg=4 ctermbg=none cterm=bold
hi Number ctermfg=4 ctermbg=none cterm=bold
hi Boolean ctermfg=4 ctermbg=none cterm=bold
hi Float ctermfg=4 ctermbg=none cterm=bold

hi Identifier ctermfg=7 ctermbg=none cterm=none
hi Function ctermfg=2 ctermbg=none cterm=none

hi Statement ctermfg=1 ctermbg=none
hi Conditional ctermfg=1 ctermbg=none
hi Repeat ctermfg=1 ctermbg=none cterm=bold
hi Operator ctermfg=6 ctermbg=none
hi Keyword ctermfg=1 ctermbg=none
hi Exception ctermfg=1 ctermbg=none cterm=bold

hi PreProc ctermfg=6 ctermbg=none
hi Include ctermfg=6 ctermbg=none
hi Define ctermfg=6 ctermbg=none
hi Macro ctermfg=2 ctermbg=none cterm=bold
hi PreCondit ctermfg=6 ctermbg=none
hi! link Label Define

hi Type ctermfg=5 ctermbg=none cterm=none
hi StorageClass ctermfg=5 ctermbg=none
hi Structure ctermfg=5 ctermbg=none
hi Typedef ctermfg=1 ctermbg=none

hi Special ctermfg=4 ctermbg=none cterm=bold
hi SpecialChar ctermfg=4 ctermbg=0 cterm=bold
hi Tag ctermfg=1 ctermbg=none
hi Delimiter ctermfg=7 ctermbg=none
hi Debug ctermfg=1 ctermbg=0
hi DebugPC ctermfg=4 ctermbg=none cterm=bold
hi DebugBreakpoint ctermfg=0 ctermbg=1

hi Ignore ctermfg=7 ctermbg=none cterm=none
hi Error ctermfg=0 ctermbg=1
hi Todo ctermfg=0 ctermbg=5 cterm=bold
" }}}
" Around syntax {{{
hi Underlined ctermfg=3 ctermbg=none cterm=underline
hi Cursor ctermfg=0 ctermbg=7 cterm=bold
hi lCursor ctermfg=0 ctermbg=4 cterm=bold
hi CursorIM ctermfg=none ctermbg=7
hi DiffAdd ctermfg=none ctermbg=0
hi DiffChange ctermfg=none ctermbg=0
hi DiffDelete ctermfg=0 ctermbg=0 cterm=bold
hi DiffText ctermfg=none ctermbg=0 cterm=underline
hi Directory ctermfg=4 ctermbg=none cterm=bold
hi MatchParen ctermfg=3 ctermbg=0 cterm=bold
hi Search ctermfg=0 ctermbg=3
hi IncSearch ctermfg=0 ctermbg=1
hi! link CurSearch IncSearch
hi! link CursorLineFold Folded
hi! link CursorLineSign SignColumn
hi SpellBad ctermfg=none ctermbg=none cterm=undercurl
hi SpellCap ctermfg=none ctermbg=none cterm=undercurl
hi SpellLocal ctermfg=none ctermbg=none cterm=undercurl
hi SpellRare ctermfg=none ctermbg=none cterm=undercurl
hi Visual ctermfg=0 ctermbg=7 cterm=none
hi VisualNOS ctermfg=none ctermbg=0 cterm=underline
hi ColorColumn ctermfg=none ctermbg=1 cterm=bold
" }}}
" UI: {{{
hi TabLineSel ctermfg=7 ctermbg=4 cterm=none
hi TabLine ctermfg=7 ctermbg=0 cterm=none
hi TabLineFill ctermfg=0 ctermbg=0 cterm=bold
hi ToolbarLine ctermfg=none ctermbg=0 cterm=bold
hi ToolbarButton ctermfg=0 ctermbg=6 cterm=bold
hi Title ctermfg=0 ctermbg=4 cterm=bold
hi WinBar ctermfg=none ctermbg=0
hi! link WinBar WinBarNC
hi StatusLine ctermfg=7 ctermbg=4 cterm=none
hi StatusLineNC ctermfg=0 ctermbg=4 cterm=bold
hi VertSplit ctermfg=4 ctermbg=0 cterm=bold
hi! link WinSeparator VertSplit
hi LineNr ctermfg=0 ctermbg=none cterm=bold
hi CursorLine ctermfg=none ctermbg=0 cterm=none
hi CursorLineNr ctermfg=3 ctermbg=none cterm=none
hi CursorColumn ctermfg=none ctermbg=0
hi SignColumn ctermfg=7 ctermbg=none
hi Folded ctermfg=0 ctermbg=0 cterm=bold
hi FoldColumn ctermfg=7 ctermbg=0 cterm=none
hi NormalFloat ctermfg=7 ctermbg=none
hi FloatBorder ctermfg=0 ctermbg=none cterm=bold
hi FloatTitle ctermfg=7 ctermbg=none
hi! link Pmenu NormalFloat
hi PmenuSel ctermfg=7 ctermbg=0 cterm=reverse
hi PmenuThumb ctermfg=0 ctermbg=7
hi PmenuSbar ctermfg=none ctermbg=none
hi! link ScrollView White
hi EndOfBuffer ctermfg=4 ctermbg=none cterm=bold
hi QuickFixLine ctermfg=none ctermbg=0
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi WildMenu ctermfg=7 ctermbg=0 cterm=none
hi ModeMsg ctermfg=4 ctermbg=none cterm=bold
hi MoreMsg ctermfg=5 ctermbg=none cterm=bold
hi Question ctermfg=3 ctermbg=none
hi WarningMsg ctermfg=1 ctermbg=none cterm=bold
hi! link MessageWindow WarningMsg
hi! link PopupNotification WarningMsg
hi ErrorMsg ctermfg=1 ctermbg=0 cterm=bold
" hi MsgArea ctermfg=none ctermbg=0
" }}}
" Markdown: {{{
" builtin: {{{
hi! link markdownH1 BoldRed
hi! link markdownH2 Yellow
hi! link markdownH3 BoldYellow
hi! link markdownH4 BoldGreen
hi! link markdownH5 BoldCyan
hi! link markdownH6 BoldBlue
hi markdownUrl ctermfg=4 ctermbg=none cterm=underline
hi markdownItalic ctermfg=none ctermbg=none cterm=none
hi markdownBold ctermfg=none ctermbg=none cterm=none
hi! link markdownItalicDelimiter Grey
hi! link markdownCodeDelimiter Grey
hi markdownCodeBlock ctermfg=none ctermbg=none cterm=none
hi! link markdownCode Green
hi! link markdownBlockquote Grey
hi! link markdownListMarker Purple
hi! link markdownOrderedListMarker Purple
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
" vim-markdown: https://github.com/gabrielelana/vim-markdown{{{
hi mkdURL ctermfg=4 ctermbg=none cterm=underline
hi mkdInlineURL ctermfg=4 ctermbg=none cterm=underline
highlight! link mkdItalic Grey
highlight! link mkdCodeDelimiter Green
highlight! link mkdBold Grey
highlight! link mkdLink Blue
highlight! link mkdHeading Grey
highlight! link mkdListItem Purple
highlight! link mkdRule Grey
highlight! link mkdDelimiter Grey
highlight! link mkdId Yellow
" }}}
" }}}
" Html: {{{
" builtin: https://notabug.org/jorgesumle/vim-html-syntax
hi htmlH1 ctermfg=1 ctermbg=none
hi htmlH2 ctermfg=1 ctermbg=none
hi htmlH3 ctermfg=3 ctermbg=none
hi htmlH4 ctermfg=2 ctermbg=none
hi htmlH5 ctermfg=4 ctermbg=none
hi htmlH6 ctermfg=5 ctermbg=none
hi htmlLink ctermfg=none ctermbg=none cterm=underline
hi htmlBold ctermfg=none ctermbg=none cterm=bold
hi htmlBoldUnderline ctermfg=none ctermbg=none cterm=bold,underline
hi htmlUnderline ctermfg=none ctermbg=none cterm=underline
hi! link htmlTag Green
hi! link htmlEndTag Blue
hi! link htmlTagN Red
hi! link htmlTagName RedI
hi! link htmlArg Cyan
hi! link htmlScriptTag Purple
hi! link htmlSpecialTagName Red
" }}}
" Xml: {{{
" builtin: https://github.com/chrisbra/vim-xml-ftplugin
hi! link xmlTag Green
hi! link xmlEndTag Blue
hi! link xmlTagName Red
hi! link xmlEqual Red
hi! link xmlAttrib Cyan
hi! link xmlEntity Red
hi! link xmlEntityPunct Red
hi! link xmlDocTypeDecl Grey
hi! link xmlDocTypeKeyword Purple
hi! link xmlCdataStart Grey
hi! link xmlCdataCdata Purple
" }}}
" CSS: {{{
" builtin: https://github.com/JulesWang/css.vim
hi! link cssAttrComma White
hi! link cssBraces White
hi! link cssTagName Purple
hi! link cssClassNameDot Red
hi! link cssClassName Red
hi! link cssFunctionName Yellow
hi! link cssAttr Red
hi! link cssProp Cyan
hi! link cssCommonAttr Yellow
hi! link cssPseudoClassId Blue
hi! link cssPseudoClassFn Green
hi! link cssPseudoClass Purple
hi! link cssImportant Red
hi! link cssSelectorOp Red
hi! link cssSelectorOp2 Red
hi! link cssColor Green
hi! link cssAttributeSelector Cyan
hi! link cssUnitDecorators Red
hi! link cssValueLength Green
hi! link cssValueInteger Green
hi! link cssValueNumber Green
hi! link cssValueAngle Green
hi! link cssValueTime Green
hi! link cssValueFrequency Green
hi! link cssVendor Grey
hi! link cssNoise Grey
" }}}
" LESS: {{{
" vim-less: https://github.com/groenewege/vim-less
hi! link lessMixinChar Grey
hi! link lessClass Red
hi! link lessVariable Blue
hi! link lessAmpersandChar Red
hi! link lessFunction Yellow
" }}}
" C#: {{{
" builtin: https://github.com/nickspoons/vim-cs
hi! link csUnspecifiedStatement Purple
hi! link csStorage Red
hi! link csClass Red
hi! link csNewType Cyan
hi! link csContextualStatement Purple
hi! link csInterpolationDelimiter Yellow
hi! link csInterpolation Yellow
hi! link csEndColon White
" }}}
" GDScript:: {{{
hi! link gdscriptOperator Red
hi! link gdscriptBlockStart BoldRed
hi! link gdscriptNode Cyan
" }}}
" Python: {{{
" builtin:
hi! link pythonBuiltin Yellow
hi! link pythonExceptions Purple
hi! link pythonDecoratorName Blue
" python-syntax: https://github.com/vim-python/python-syntax
hi! link pythonExClass Purple
hi! link pythonBuiltinType Yellow
hi! link pythonBuiltinObj Blue
hi! link pythonDottedName Purple
hi! link pythonBuiltinFunc Green
hi! link pythonFunction Cyan
hi! link pythonDecorator Red
hi! link pythonInclude Include
hi! link pythonImport PreProc
hi! link pythonRun Blue
hi! link pythonCoding Grey
hi! link pythonOperator Red
hi! link pythonConditional Red
hi! link pythonRepeat Red
hi! link pythonException Red
hi! link pythonNone Cyan
hi! link pythonDot Grey
" }}}
" Lua: {{{
" builtin:
hi! link luaFunc Green
hi! link luaFunction Green
hi! link luaTable White
hi! link luaIn Red
" vim-lua: https://github.com/tbastos/vim-lua
hi! link luaFuncCall Green
hi! link luaLocal Red
hi! link luaSpecialValue Green
hi! link luaBraces White
hi! link luaBuiltIn Purple
hi! link luaNoise Grey
hi! link luaLabel Purple
hi! link luaFuncTable Yellow
hi! link luaFuncArgName Blue
hi! link luaEllipsis Red
hi! link luaDocTag Green
" }}}
" Ruby: {{{
" builtin: https://github.com/vim-ruby/vim-ruby
hi! link rubyKeywordAsMethod Green
hi! link rubyInterpolation Yellow
hi! link rubyInterpolationDelimiter Yellow
hi! link rubyStringDelimiter Green
hi! link rubyBlockParameterList Blue
hi! link rubyDefine Red
hi! link rubyModuleName Purple
hi! link rubyAccess Red
hi! link rubyAttribute Yellow
hi! link rubyMacro Red
" }}}
" Rust: {{{
" builtin: https://github.com/rust-lang/rust.vim
" hi! link rustStructure Red
hi! link rustKeyword Statement
hi! link rustIdentifier Identifier
hi! link rustModPath Identifier
hi! link rustSelf Identifier
hi! link rustAttribute White
hi! link rustDerive Define
hi! link rustModPathSep NonText
hi! link rustOperator Operator
hi! link rustQuestionMark Operator
hi! link rustSigil Operator
hi! link rustLifetime Operator
hi! link rustStorage Type
hi! link rustDeriveTrait Type
" hi! link rustEscape 
" hi! link rustEnum 
" hi! link rustEnumVariant 
" hi! link rustMacroVariable 
" hi! link rustPanic 
" hi! link rustAssert 
" hi! link rustPubScope 
" hi! link rustPubScopeCrate 
" hi! link rustSuper 
" }}}
" Haskell: {{{
" haskell-vim: https://github.com/neovimhaskell/haskell-vim
hi! link haskellBrackets Blue
hi! link haskellIdentifier White
hi! link haskellAssocType Cyan
hi! link haskellQuotedType Cyan
hi! link haskellType Cyan
hi! link haskellDeclKeyword Red
hi! link haskellWhere Red
hi! link haskellDeriving Purple
hi! link haskellForeignKeywords Purple
" }}}
" Shell: {{{
" builtin: http://www.drchip.org/astronaut/vim/index.html#SYNTAX_SH
hi! link shRange White
hi! link shCmdSubRegion White
hi! link shExprRegion White
hi! link shDerefSimple White
hi! link shFunctionKey Grey
hi! link shVariable Identifier
hi! link shFor Function
hi! link shTestOpr Operator
hi! link shOperator Operator
hi! link shSetOption Operator
hi! link shOption Operator
hi! link shVarAssign Operator
hi! link shCtrlSeq Operator
hi! link shSpecialNoZS Operator
hi! link shSpecialDQ Operator
hi! link shQuote String
hi! link shDoubleQuote String
hi! link shSnglCase Statement
hi! link shSet Exception
hi! link shSetList Type
hi! link shStatement Macro
hi! link shCommandSub Macro
hi! link shFunctionOne Macro
" }}}
" Makefile: {{{
hi! link makeIdent Cyan
hi! link makeSpecTarget Yellow
hi! link makeTarget Blue
hi! link makeCommands Red
" }}}
" Json: {{{
hi! link jsonKeyword Red
hi! link jsonQuote Grey
hi! link jsonBraces White
" }}}
" Yaml: {{{
hi! link yamlKey Red
hi! link yamlConstant Purple
" }}}
" Toml: {{{
hi tomlTable ctermfg=5 ctermbg=none cterm=bold
hi! link tomlKey Red
hi! link tomlBoolean Blue
hi! link tomlTableArray tomlTable
" }}}
" Diff: {{{
hi! link diffAdded Green
hi! link diffRemoved Red
hi! link diffChanged Purple
hi! link diffOldFile Yellow
hi! link diffNewFile Red
hi! link diffFile Cyan
hi! link diffLine Grey
hi! link diffIndexLine Blue
" }}}
" Help: {{{
hi helpNote ctermfg=5 ctermbg=none cterm=bold
hi helpHeadline ctermfg=1 ctermbg=none cterm=bold
hi helpHeader ctermfg=1 ctermbg=none cterm=bold
hi helpURL ctermfg=2 ctermbg=none cterm=underline
hi helpHyperTextEntry ctermfg=3 ctermbg=none cterm=bold
hi! link helpHyperTextJump Yellow
hi! link helpCommand Cyan
hi! link helpExample Green
hi! link helpSpecial Blue
hi! link helpSectionDelim Grey
hi! link FernLeaderSymbol NonText
" }}}
" Diagnostics: {{{
hi DiagnosticError ctermfg=1 ctermbg=none cterm=bold
hi DiagnosticWarn ctermfg=0 ctermbg=none cterm=bold
hi DiagnosticInfo ctermfg=0 ctermbg=none cterm=bold
hi DiagnosticHint ctermfg=0 ctermbg=none cterm=bold
hi DiagnosticVirtualTextError ctermfg=1 ctermbg=none cterm=bold
hi DiagnosticVirtualTextWarn ctermfg=0 ctermbg=none cterm=bold
hi DiagnosticVirtualTextInfo ctermfg=0 ctermbg=none cterm=bold
hi DiagnosticVirtualTextHint ctermfg=0 ctermbg=none cterm=bold
" hi DiagnosticUnderlineError ctermfg=none ctermbg=none
" hi DiagnosticUnderlineWarn ctermfg=none ctermbg=none cterm=bold
" hi DiagnosticUnderlineInfo ctermfg=none ctermbg=none cterm=bold
" hi DiagnosticUnderlineHint ctermfg=none ctermbg=none cterm=bold
hi! link DiagnosticSignError DiagnosticError
hi! link DiagnosticSignWarn DiagnosticWarn
hi! link DiagnosticSignInfo DiagnosticInfo
hi! link DiagnosticSignHint DiagnosticHint
" }}}
" Plugins
" --------------
" junegunn/fzf.vim{{{
let g:fzf_colors = {
      \ 'prompt':  ['White', 'Blue']
      \ }
" }}}
" Fern {{{
hi FernRootText ctermfg=6 cterm=bold
hi FernBranchText ctermfg=4 ctermbg=none cterm=bold
hi! link FernRootSymbol NonText
hi! link FernBranchSymbol NonText
hi! link FernLeafSymbol NonText
hi! link FernMarkedLine Yellow
hi! link FernMarkedText Yellow
" }}}
" kshenoy/vim-signature {{{
hi SignatureMarkText ctermfg=2 ctermbg=none cterm=bold
hi SignatureMarkerText ctermfg=2 ctermbg=none cterm=bold
" }}}
" Treesitter {{{
hi! link @attribute Constant
hi! link @constant.builtin Constant
hi! link @punctuation.delimiter Delimiter
hi! link @punctuation.special Delimiter
hi! link @function.builtin Function
hi! link @string.regex SpecialChar
hi! link @storageclass.lifetime Label
hi! link @punctuation.bracket White
hi! link @keyword.return BoldRed
hi! link @variable.builtin White
hi! link @constructor.lua @punctuation.bracket
hi! link @lsp.type.lifetime.rust BoldYellow
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
" Telescope: {{{
hi TelescopeBorder ctermfg=0 ctermbg=none cterm=bold
hi! link TelescopeTitle FloatTitle
hi! link TelescopePromptPrefix Grey
hi TelescopeMatching ctermfg=3 ctermbg=none
hi TelescopeSelection ctermfg=0 ctermbg=7
hi TelescopeSelectionCaret ctermfg=0 ctermbg=7
hi! link TelescopeMultiSelection Green
hi! link TelescopeMultiIcon Green
" }}}
" Neo-tree {{{
hi! link NeoTreeIndentMarker       Whitespace
hi! link NeoTreeExpander           Comment
hi! link NeoTreeRootName           Tag
hi! link NeoTreeDirectoryIcon      Directory
hi! link NeoTreeDirectoryName      Directory
hi! link NeoTreeSymbolicLinkTarget PreProc
hi! link NeoTreeFileNameOpened     Yellow
hi! link NeoTreeModified       Purple
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
" mbbill/undotree{{{
hi! link UndotreeSavedBig BoldPurple
hi! link UndotreeSavedSmall Purple
hi! link UndotreeNode BoldYellow
hi! link UndotreeNodeCurrent BoldYellow
hi! link UndotreeSeq Green
hi! link UndotreeNext BoldBlue
hi! link UndotreeTimeStamp Grey
hi! link UndotreeHead Yellow
hi! link UndotreeBranch Yellow
hi! link UndotreeCurrent Red
" }}}
" Illuminate {{{
" hi IlluminatedWordText ctermfg=none ctermbg=none cterm=underline
" hi IlluminatedWordRead ctermfg=none ctermbg=none cterm=underline
" hi IlluminatedWordWrite ctermfg=none ctermbg=none cterm=underline
" }}}
" Marks {{{
hi! link MarkSignHL BoldRed
hi! link MarkSignNumHL LineNr
hi! link MarkVirtTextHL DiagnosticHint
" }}}
" Pounce {{{
hi! link PounceMatch White
hi! link PounceUnmatched Grey
hi PounceGap ctermfg=0 ctermbg=none cterm=bold
hi! link PounceAccept BoldRed
hi! link PounceAcceptBest BoldRed
" }}}
" Trouble {{{
hi! link TroubleIndentFoldClosed Comment
hi! link TroubleIndentFoldOpen Comment
" }}}
hi! link WhichKey Statement
hi! link WhichKeyGroup Function
hi! link WhichKeyTitle FloatBorder

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker fmr={{{,}}}:

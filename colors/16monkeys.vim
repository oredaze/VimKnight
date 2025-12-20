" Vim color file
"
" Name:    16monkeys
" Author:  Bobby Veli <2drealm@gmail.com>

hi clear
if exists("syntax_on")
	syntax reset
endif
set background=dark

let g:colors_name = "16monkeys"

" tty fix
if &t_Co == 8
	hi Grey ctermfg=0 ctermbg=none cterm=bold
	hi Comment ctermfg=0 ctermbg=none cterm=bold
	hi SpecialComment ctermfg=0 ctermbg=none cterm=bold
	hi LineNr ctermfg=0 ctermbg=none cterm=bold
	hi NonText ctermfg=0 ctermbg=none cterm=bold
	hi SpecialKey ctermfg=0 ctermbg=none cterm=bold
	hi Conceal ctermfg=0 ctermbg=none cterm=bold
	hi Folded ctermfg=0 ctermbg=0 cterm=bold
	hi FoldColumn ctermfg=0 ctermbg=0 cterm=bold
	hi TabLineFill ctermfg=0 ctermbg=0 cterm=bold
	hi ToolbarButton ctermfg=0 ctermbg=6 cterm=bold
	hi StatusLine ctermfg=7 ctermbg=0 cterm=none
	hi StatusLineNC ctermfg=0 ctermbg=0 cterm=bold
	hi Whitespace ctermfg=0 ctermbg=0 cterm=bold
	hi User1 ctermfg=0 ctermbg=0 cterm=bold
else
	hi Grey ctermfg=8 ctermbg=none cterm=none
	hi Comment ctermfg=8 ctermbg=none cterm=none
	hi SpecialComment ctermfg=8 ctermbg=none cterm=none
	hi LineNr ctermfg=8 ctermbg=none cterm=none
	hi NonText ctermfg=8 ctermbg=none cterm=none
	hi SpecialKey ctermfg=235 ctermbg=none cterm=none
	hi Conceal ctermfg=8 ctermbg=none cterm=none
	hi Folded ctermfg=8 ctermbg=0 cterm=none
	hi FoldColumn ctermfg=8 ctermbg=0 cterm=none
	hi TabLineFill ctermfg=8 ctermbg=0 cterm=none
	hi ToolbarButton ctermfg=8 ctermbg=6 cterm=none
	hi StatusLine ctermfg=7 ctermbg=0 cterm=none
	hi StatusLineNC ctermfg=8 ctermbg=0 cterm=none
	hi Whitespace ctermfg=237 ctermbg=0 cterm=none
	hi User1 ctermfg=8 ctermbg=0 cterm=none
endif

" Predefined Highlight Groups: {{{
hi Warn ctermfg=1 ctermbg=none cterm=bold
hi Fg ctermfg=7 ctermbg=none
hi Red ctermfg=1 ctermbg=none
hi Green ctermfg=2 ctermbg=none
hi Yellow ctermfg=3 ctermbg=none
hi Blue ctermfg=4 ctermbg=none
hi Purple ctermfg=5 ctermbg=none
hi Cyan ctermfg=6 ctermbg=none
hi BoldGrey ctermfg=0 ctermbg=none cterm=bold
hi BoldRed ctermfg=1 ctermbg=none cterm=bold
hi BoldGreen ctermfg=2 ctermbg=none cterm=bold
hi BoldYellow ctermfg=3 ctermbg=none cterm=bold
hi BoldBlue ctermfg=4 ctermbg=none cterm=bold
hi BoldPurple ctermfg=5 ctermbg=none cterm=bold
hi BoldCyan ctermfg=6 ctermbg=none cterm=bold
" }}}
" Syntax {{{
hi Normal ctermfg=7 ctermbg=none
hi Constant ctermfg=4 ctermbg=none cterm=none
hi String ctermfg=3 ctermbg=none cterm=none
hi Character ctermfg=4 ctermbg=none
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
hi Label ctermfg=6 ctermbg=none

hi Type ctermfg=5 ctermbg=none cterm=none
hi StorageClass ctermfg=5 ctermbg=none
hi Structure ctermfg=5 ctermbg=none
hi Typedef ctermfg=1 ctermbg=none

hi Special ctermfg=4 ctermbg=none
hi SpecialChar ctermfg=4 ctermbg=0 cterm=bold
hi Tag ctermfg=1 ctermbg=none
hi Delimiter ctermfg=7 ctermbg=none
hi Debug ctermfg=1 ctermbg=0
hi DebugPC ctermfg=4 ctermbg=none
hi DebugBreakpoint ctermfg=0 ctermbg=1

hi Ignore ctermfg=7 ctermbg=none cterm=none
hi Error ctermfg=0 ctermbg=1
hi Todo ctermfg=0 ctermbg=5 cterm=bold
" }}}
" Around syntax {{{
hi Underlined ctermfg=3 ctermbg=none cterm=underline
hi Cursor ctermfg=0 ctermbg=7 cterm=bold
hi lCursor ctermfg=0 ctermbg=4 cterm=bold
hi vCursor ctermfg=0 ctermbg=3 cterm=bold
hi iCursor ctermfg=0 ctermbg=7 cterm=bold
hi CursorIM ctermfg=none ctermbg=7
hi DiffAdd ctermfg=2 ctermbg=0
hi DiffChange ctermfg=none ctermbg=0
hi DiffDelete ctermfg=0 ctermbg=0 cterm=bold
hi DiffText ctermfg=5 ctermbg=0 cterm=underline
hi Directory ctermfg=4 ctermbg=none
hi MatchParen ctermfg=1 ctermbg=0 cterm=bold,underline
hi Search ctermfg=0 ctermbg=7
hi IncSearch ctermfg=3 ctermbg=0
hi CurSearch ctermfg=3 ctermbg=0
hi! link CursorLineFold Folded
hi CursorLineSign ctermfg=7 ctermbg=none
hi SpellBad ctermfg=none ctermbg=none cterm=undercurl
hi SpellCap ctermfg=none ctermbg=none cterm=undercurl
hi SpellLocal ctermfg=none ctermbg=none cterm=undercurl
hi SpellRare ctermfg=none ctermbg=none cterm=undercurl
hi Visual ctermfg=0 ctermbg=7 cterm=none
hi VisualNOS ctermfg=none ctermbg=0 cterm=underline
hi ColorColumn ctermfg=none ctermbg=1 cterm=bold
hi Substitute ctermfg=0 ctermbg=2 cterm=none
" }}}
" UI: {{{
hi TabLineSel ctermfg=2 ctermbg=0 cterm=bold
hi TabLine ctermfg=7 ctermbg=0 cterm=none
hi ToolbarLine ctermfg=none ctermbg=0 cterm=bold
hi Title ctermfg=6 ctermbg=0 cterm=none
hi CursorLine ctermfg=none ctermbg=0 cterm=none
hi CursorLineNr ctermfg=3 ctermbg=none cterm=bold
hi CursorColumn ctermfg=none ctermbg=0
hi SignColumn ctermfg=7 ctermbg=none
hi FoldColumn ctermfg=7 ctermbg=0 cterm=none
hi WinSeparator ctermfg=0 ctermbg=0 cterm=bold
hi VertSplit ctermfg=0 ctermbg=0 cterm=bold
hi Pmenu ctermfg=7 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=7
hi PmenuThumb ctermfg=0 ctermbg=7
hi PmenuSbar ctermfg=none ctermbg=none
hi PmenuKind ctermfg=7 ctermbg=0
hi PmenuKindSel ctermfg=0 ctermbg=7
hi PmenuExtra ctermfg=7 ctermbg=0
hi PmenuExtraSel ctermfg=0 ctermbg=7
hi PopupSelected ctermfg=0 ctermbg=7
hi NormalFloat ctermfg=7 ctermbg=0
hi FloatBorder ctermfg=0 ctermbg=0 cterm=bold
hi FloatTitle ctermfg=0 ctermbg=0 cterm=bold
hi EndOfBuffer ctermfg=4 ctermbg=none cterm=bold
hi QuickFixLine ctermfg=none ctermbg=0
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi WildMenu ctermfg=0 ctermbg=7
hi ModeMsg ctermfg=2 ctermbg=none cterm=bold
hi MoreMsg ctermfg=5 ctermbg=none cterm=bold
hi Question ctermfg=4 ctermbg=none
hi WarningMsg ctermfg=3 ctermbg=none cterm=bold
hi MessageWindow ctermfg=3 ctermbg=none cterm=bold
hi PopupNotification ctermfg=3 ctermbg=none cterm=bold
hi ErrorMsg ctermfg=1 ctermbg=0 cterm=bold
" hi MsgArea ctermfg=none ctermbg=0
" }}}

" Markdown: {{{
hi DiagnosticError ctermfg=1 ctermbg=0
hi DiagnosticWarn ctermfg=3 ctermbg=0
hi DiagnosticInfo ctermfg=4 ctermbg=0
hi DiagnosticHint ctermfg=0 ctermbg=none cterm=bold
hi! link DiagnosticVirtualTextError Grey
hi! link DiagnosticVirtualTextWarn Grey
hi! link DiagnosticVirtualTextInfo Grey
hi! link DiagnosticVirtualTextHint Grey
hi DiagnosticUnderlineError ctermfg=none ctermbg=none cterm=underline
hi DiagnosticUnderlineWarn ctermfg=none ctermbg=none cterm=none
hi DiagnosticUnderlineInfo ctermfg=none ctermbg=none cterm=none
hi DiagnosticUnderlineHint ctermfg=none ctermbg=none cterm=none
" }}}

" Markdown: {{{
hi markdownH1 ctermfg=1 ctermbg=none cterm=bold
hi markdownH2 ctermfg=3 ctermbg=none cterm=bold
hi markdownH3 ctermfg=6 ctermbg=none cterm=bold
hi markdownH4 ctermfg=5 ctermbg=none cterm=bold
hi markdownH5 ctermfg=2 ctermbg=none cterm=bold
hi markdownH6 ctermfg=4 ctermbg=none cterm=bold
hi markdownUrl ctermfg=4 ctermbg=none cterm=underline
hi markdownBold ctermfg=none ctermbg=none cterm=bold
hi! link markdownBoldDelimiter Grey
hi markdownItalic ctermfg=3 cterm=none
hi markdownItalicDelimiter ctermfg=0 ctermbg=none cterm=bold
hi! link markdownCode Green
hi! link markdownCodeBlock Green
hi! link markdownCodeDelimiter Grey
hi! link markdownBlockquote Grey
hi! link markdownListMarker Purple
hi! link markdownOrderedListMarker Purple
hi! link markdownRule Grey
hi! link markdownHeadingRule Grey
hi! link markdownUrlDelimiter Grey
hi! link markdownLinkText Cyan
hi! link markdownLinkDelimiter Grey
hi! link markdownLinkTextDelimiter Grey
hi! link markdownHeadingDelimiter Grey
hi! link markdownUrlTitle Purple
hi! link markdownUrlTitleDelimiter Yellow
hi! link markdownIdDeclaration markdownLinkText
hi! link markdownId Yellow
hi markdownAutomaticLink ctermfg=6
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
hi! link cssAttrComma Fg
hi! link cssBraces Fg
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
hi! link csEndColon Fg
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
hi! link luaTable Fg
hi! link luaIn Red
" vim-lua: https://github.com/tbastos/vim-lua
hi! link luaFuncCall Green
hi! link luaLocal Red
hi! link luaSpecialValue Green
hi! link luaBraces Fg
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
hi! link rustAttribute Fg
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
hi! link haskellIdentifier Fg
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
hi! link shRange Fg
hi! link shCmdSubRegion Fg
hi! link shExprRegion Fg
hi! link shDerefSimple Fg
hi! link shFunctionKey BoldGrey
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
hi! link jsonBraces Fg
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
hi! link Added Green
hi! link Removed Red
hi! link Changed Blue
hi! link diffAdd Green
hi! link diffDelete Red
hi! link diffDeleted Red
hi! link diffChange Blue
hi! link diffAdded Green
hi! link diffRemoved Red
hi! link diffChanged Blue
hi! link diffOldFile Yellow
hi! link diffNewFile Red
hi! link diffFile Cyan
hi! link diffLine Grey
hi! link diffIndexLine Purple
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
hi GentooPackageUseUse ctermfg=2
" Plugins
" --------------
" junegunn/fzf.vim{{{
let g:fzf_colors = {
	\ 'prompt':  ['fg', 'Blue']
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
hi SignatureMarkText ctermfg=5 ctermbg=none cterm=bold
hi SignatureMarkerText ctermfg=5 ctermbg=none cterm=bold
" }}}
" airblade/vim-gitgutter {{{
hi GitGutterAdd    ctermfg=2 ctermbg=none cterm=none
hi GitGutterChange ctermfg=4 ctermbg=none cterm=none
hi GitGutterDelete ctermfg=1 ctermbg=none cterm=none
hi GitGutterChangeDelete ctermfg=4 ctermbg=none cterm=none
" }}}
" gitsigns {{{
hi GitSignsAdd ctermfg=2 ctermbg=none
hi GitSignsChange ctermfg=4 ctermbg=none
hi GitSignsDelete ctermfg=1 ctermbg=none
hi GitSignsTopdelete ctermfg=1 ctermbg=none
hi GitSignsChangedelete ctermfg=1 ctermbg=none
hi GitSignsUntracked ctermfg=6 ctermbg=none
hi GitSignsAddInline ctermfg=none ctermbg=2
hi GitSignsChangeLnInline ctermfg=none ctermbg=4
hi GitSignsDeleteInline ctermfg=none ctermbg=1
hi GitSignsAddPreview ctermfg=2 ctermbg=none
hi GitSignsDeletePreview ctermfg=1 ctermbg=none
" }}}
" Statusline misc {{{
" modified, etc. sigils
hi User2 ctermfg=1 ctermbg=0 cterm=bold
" selection arrows
hi User3 ctermfg=2 ctermbg=0
" CWD
hi User4 ctermfg=6 ctermbg=0
" }}}
" matchup {{{
hi MatchParenCur ctermfg=none ctermbg=none cterm=bold
hi MatchWord ctermfg=none ctermbg=none cterm=underline
hi MatchWordCur ctermfg=none ctermbg=none cterm=underline
" }}}
" marks {{{
hi MarkSignHL ctermfg=0 ctermbg=0 cterm=bold
hi! link MarkSignNumHL LineNr
" }}}
" pounce {{{
hi PounceMatch ctermfg=4
hi PounceUnmatched ctermfg=0 ctermbg=none cterm=bold
hi PounceGap ctermfg=0 ctermbg=none cterm=bold,underline
hi PounceAccept ctermfg=7 ctermbg=1
hi PounceAcceptBest ctermfg=7 ctermbg=1
" }}}
" whichkey {{{
hi WhichKey ctermfg=1 ctermbg=none
hi WhichKeyGroup ctermfg=2 ctermbg=none
hi WhichKeyTitle ctermfg=0 ctermbg=0 cterm=bold
" }}}
" telescope {{{
hi! link TelescopeBorder FloatBorder
hi TelescopeTitle ctermfg=0 ctermbg=0 cterm=bold
hi TelescopePromptPrefix ctermfg=0 ctermbg=0 cterm=bold
hi TelescopeMatching ctermfg=4 ctermbg=none
hi TelescopeSelection ctermfg=0 ctermbg=7
hi TelescopeSelectionCaret ctermfg=0 ctermbg=7
hi TelescopeMultiSelection ctermfg=3
hi TelescopeMultiIcon ctermfg=0 ctermbg=none cterm=bold
" }}}
" signify {{{
hi SignifySignAdd ctermfg=2 ctermbg=none
hi SignifySignChange ctermfg=4 ctermbg=none
hi SignifySignDelete ctermfg=1 ctermbg=none
hi SignifySignChangeDelete ctermfg=4 ctermbg=none
" }}}
" mini {{{
hi! link MiniFilesBorder FloatBorder
hi! link MiniFilesBorderModified Number
hi MiniFilesCursorLine ctermfg=0 ctermbg=7
hi! link MiniFilesDirectory Directory
hi MiniFilesFile ctermfg=7
hi MiniFilesNormal ctermfg=7 ctermbg=0
hi MiniFilesTitle ctermfg=0 ctermbg=0 cterm=bold
hi MiniFilesTitleFocused ctermfg=6 ctermbg=none
" }}}
hi Elevator ctermfg=0 ctermbg=0 cterm=bold,reverse
hi EasyJump ctermfg=0 ctermbg=3 cterm=none

hi! link @annotation Normal
hi! link @attribute Constant
hi! link @attribute.typescript Function
hi! link @boolean Boolean
hi! link @character Character
hi! link @comment Comment
hi! link @comment.todo Todo
hi! link @comment.todo.unchecked Todo
hi! link @comment.todo.checked Todo
hi! link @constant Constant
hi! link @constant.builtin Constant
hi! link @constant.macro Constant
hi @constructor ctermfg=7
hi! link @diff.add DiffAdded
hi! link @diff.delete DiffDeleted
hi! link @diff.plus DiffAdded
hi! link @diff.minus DiffDeleted
hi! link @diff.delta DiffChanged
hi! link @error Error
hi! link @function Function
hi! link @function.builtin Function
hi! link @function.macro Macro
hi! link @function.method Function
hi! link @keyword Keyword
hi! link @keyword.conditional Conditional
hi! link @keyword.directive Keyword
hi! link @keyword.exception Exception
hi! link @keyword.function Keyword
hi! link @keyword.import Include
hi! link @keyword.operator Include
hi! link @keyword.repeat Keyword
hi! link @label Label
hi! link @module Structure
hi! link @none Normal
hi! link @number Number
hi! link @number.float Float
hi! link @operator Operator
hi! link @parameter.reference Identifier
hi! link @property Identifier
hi! link @punctuation.delimiter Delimiter
hi @punctuation.bracket ctermfg=7
hi! link @string String
hi! link @string.regexp String
hi! link @string.escape String
hi! link @string.special.symbol SpecialChar
hi! link @tag Tag
hi! link @tag.attribute Tag
hi! link @tag.delimiter Delimiter
hi @text ctermfg=7
hi @note ctermfg=7
hi! link @warning WarningMsg
hi! link @danger ErrorMsg
hi! link @type Type
hi! link @type.builtin Type
hi! link @variable Identifier
hi! link @variable.builtin Identifier
hi! link @variable.member Identifier
hi! link @variable.parameter Identifier
hi! link @lsp.type.comment @comment
hi! link @lsp.type.enumv @type
hi! link @lsp.type.enumMember @constant.builtin
hi! link @lsp.type.interface @type
hi! link @lsp.type.typeParameter @type
hi! link @lsp.type.keyword @keyword
hi! link @lsp.type.namespace @module
hi! link @lsp.type.parameter @variable.parameter
hi! link @lsp.type.property @property
hi! link @lsp.type.variable @variable
hi! link @lsp.type.macro @function.macro
hi! link @lsp.type.method @function.method
hi! link @lsp.type.number @number
hi! link @lsp.type.generic @text
hi! link @lsp.type.builtinType @type.builtin
hi! link @lsp.typemod.method.defaultLibrary @function
hi! link @lsp.typemod.function.defaultLibrary @function
hi! link @lsp.typemod.operator.injected @operator
hi! link @lsp.typemod.string.injected @string
hi! link @lsp.typemod.variable.defaultLibrary @variable.builtin
hi! link @lsp.typemod.variable.injected @variable
hi! link @lsp.typemod.variable.static @constant

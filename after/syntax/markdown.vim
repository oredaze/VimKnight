syntax match markdownZetBracket /\[\[/ containedin=ALL
syntax match markdownZetLinkText /\[\[.*\]\]/ containedin=ALL
syntax match markdownZetBracket /\]\]/ containedin=ALL

hi! link markdownZetBracket markdownLinkDelimiter
hi! link markdownZetLinkText Type

syntax match markdownConcealLine /^---$/ conceal
setlocal conceallevel=2 concealcursor=n

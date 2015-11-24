#!/bin/bash

## Methods:
#
#   var g = document.getElementsByTagName('canvas')[0].getContext('webgl');
#   var l = [];
#   for (var k in g)
#     if (!Object.hasOwnProperty(k) && !WebGLRenderingContext.hasOwnProperty(k))
#       l.push(k);
#   console.log(l.join('\n'));

## Values:
#
#   var g = document.getElementsByTagName('canvas')[0].getContext('webgl');
#   var l = [];
#   for (var k in g)
#     if (WebGLRenderingContext.hasOwnProperty(k))
#       l.push(k);
#   console.log(l.join('\n'));

set -euo pipefail

declare -r out='syntax/webgl.vim'

mkdir -p -- 'syntax'

cat > "${out}" <<EOF
" Auto-generated on $(date -uIdate)

" Mark K Cowan, mark@battlesnake.co.uk, hackology.co.uk

syntax keyword javascriptWebglContext containedin=ALLBUT,javascriptComment,javascriptLineComment,javascriptString,javascriptTemplate,javascriptTemplateSubstitution gl nextgroup=javascriptWebglDot skipwhite

syntax match javascriptWebglDot contained /\./ nextgroup=javascriptWebglMethods,javascriptWebglValues skipwhite

syntax keyword javascriptWebglMethods contained containedin=ALLBUT,javascriptComment,javascriptLineComment,javascriptString,javascriptTemplate,javascriptTemplateSubstitution $(paste -sd' ' methods)

syntax keyword javascriptWebglValues contained containedin=ALLBUT,javascriptComment,javascriptLineComment,javascriptString,javascriptTemplate,javascriptTemplateSubstitution $(paste -sd' ' values)

if version >= 508 || !exists("did_wegbl_syntax_inits")
  if version < 508
    let did_webgl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink javascriptWebglContext		PreProc
  HiLink javascriptWebglMethods		PreProc
  HiLink javascriptWebglValues		Constant

  delcommand HiLink
endif
EOF

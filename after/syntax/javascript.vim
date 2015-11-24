let s:path = expand('<sfile>:p:h')
if b:current_syntax == 'javascript'
	exe('source '.fnameescape(s:path.'/../../syntax/webgl.vim'))
endif

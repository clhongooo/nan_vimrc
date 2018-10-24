" Lines of history Vim has to remeber.
set history=500

" Enable filetype plugins.
filetype plugin on
filetype indent on

" Auto write & read when a file is changed from the outside.
set autowrite
set autoread

" Set <leader>.
let mapleader=","
let g:mapleader=","

" Deal with unsaved file.
set confirm

" Turn backup off.
set nobackup
set nowb
set noswapfile

" Hidden startup message.
set shortmess=atI

" Save file for handling the permission-denied error.
"command W w !sudo tee % > /dev/null

" Show line number $ position.
set nu
set ruler
" Highlight current column and line.
set cursorcolumn
set cursorline

set hlsearch

" Turn mouse off.
set mouse-=a

" Moving with 7 lines.
set so=7

" Encoding & Language.
set encoding=utf8
set ffs=unix,dos,mac
set ff=unix
let $LANG='en'

" Tab 
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
" Tab length on specific file types.
autocmd FileType c,cpp set shiftwidth=4 | set tabstop=4 | set softtabstop=4

" Linebreak
set lbr
set tw=500

" Indent
set ai
set si
set wrap

" Wildmenu
set wildmenu

set wildignore=*.o,*.so,*~,*.pyc,*.swp,*.zip,*.png,*.jpg,*.gif
set wildignore+=*/tmp/*,*/.git/*

" Height of command bar.
set cmdheight=2

" Buffer becomes hidden when it it abandoned.
set hid

" Turn off pulling down GUI menu.
set winaltkeys=no

" Configure backspace.
set backspace=eol,start,indent
set whichwrap+=b,s,<,>,[,],~,h,l

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb= 
set tm=500 
" Add a bit extra margin to the left.
set foldcolumn=1

" Enable syntax hignlighting.
syntax enable

" Auto insert head title
autocmd BufNewFile *.c,*.cpp,*.sh,*.cc exec ":call SetTitle()"
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: clhongooo") 
		call append(line(".")+2, "\# mail: clhongooo@163.com") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: clhongooo") 
		call append(line(".")+2, "	> Mail: clhongooo@163.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if &filetype == 'cc'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    autocmd BufNewFile * normal G
endfunc

autocmd BufNewFile *.{h,hpp} exec ":call SetHeadFileTitle()" 
func SetHeadFileTitle()
	call setline(1,"/***************************************************************************")
	call append(line("."), "	> File Name: ".expand("%")) 
	call append(line(".")+1, "	> Author: clhongooo") 
	call append(line(".")+2, "	> Mail: clhongooo@163.com") 
	call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
	call append(line(".")+4, " ************************************************************************/") 
	call append(line(".")+5, "#ifndef ".substitute(toupper(expand("%")),"\\.","_","g")."_")
	call append(line(".")+6, "#define ".substitute(toupper(expand("%")),"\\.","_","g")."_")
	call append(line(".")+7, "")
	call append(line(".")+8, "#endif//".substitute(toupper(expand("%")),"\\.","_","g")."_")
	autocmd BufNewFile * normal G
endfunc


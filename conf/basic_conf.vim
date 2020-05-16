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
" set cursorcolumn
set cursorline

set hlsearch

" Turn mouse off.
set mouse-=a

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
autocmd FileType c,cpp set shiftwidth=2 | set tabstop=2 | set softtabstop=2

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

 " Sample mapping
 nmap xd :q<return>
 nmap xs :w<return>
 nmap xv :vsp<return>
 nmap xh :sp<return>
 nmap xe :Ex<return>
 nmap xll <C-W><C-L>
 nmap xjj <C-W><C-J>
 nmap xhh <C-W><C-H>
 nmap xkk <C-W><C-K>
 nmap xo <C-O>
 nmap xf <C-F>
 nmap xb <C-B>

 " Auto insert head title
 autocmd BufNewFile *.c,*.cpp,*.sh,*.cc exec ":call SetTitle()"
 func SetTitle()
     if &filetype == 'sh'
         call setline(1, "\# By lihongchen")
         call append(line("."), "\#!/bin/bash")
         call append(line(".")+1, "")
     else
         call setline(1, "// By lihongchen")
         call append(line("."), "")
     endif
     if &filetype == 'cpp'
         call append(line(".")+1, "#include<iostream>")
         call append(line(".")+2, "using namespace std;")
         call append(line(".")+3, "")
     endif
     if &filetype == 'c'
         call append(line(".")+1, "#include<stdio.h>")
         call append(line(".")+2, "")
     endif
     if &filetype == 'cc'
        call append(line(".")+1, "#include<iostream>")
        call append(line(".")+2, "using namespace std;")
        call append(line(".")+3, "")
    endif
    autocmd BufNewFile * normal G
 endfunc

 autocmd BufNewFile *.{h,hpp} exec ":call SetHeadFileTitle()"
 func SetHeadFileTitle()
     call setline(1, "// By lihongchen")
     call append(line("."), "")
     call append(line(".")+1, "#ifndef ".substitute(toupper(expand("%")),"\\.","_","g")."_")
     call append(line(".")+2, "#define ".substitute(toupper(expand("%")),"\\.","_","g")."_")
     call append(line(".")+3, "")
     call append(line(".")+4, "#endif//".substitute(toupper(expand("%")),"\\.","_","g")."_")
     autocmd BufNewFile * normal G
 endfunc

" deal with messy code
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

" clang-format
let g:clang_format#command = 'clang-format'
nmap xm :ClangFormat<cr>
autocmd FileType c ClangFormatAutoEnable
let g:clang_format#detect_style_file = 1


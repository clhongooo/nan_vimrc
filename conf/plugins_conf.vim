"""""""""""""""""""""""""""""""""
" Config molokai & lightline
"""""""""""""""""""""""""""""""""
set laststatus=2
if !has('gui_running')
    set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
set noshowmode
set background=dark
colorscheme molokai

"""""""""""""""""""""""""""""""""
" Config vim-maximizer
"""""""""""""""""""""""""""""""""
let g:maximizer_default_mapping_key = '<F4>'

"""""""""""""""""""""""""""""""""
" Config obvious-resize
"""""""""""""""""""""""""""""""""
noremap <silent> <C-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <C-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <C-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <C-Right> :<C-U>ObviousResizeRight<CR>

"""""""""""""""""""""""""""""""""
" Config nerdtree
"""""""""""""""""""""""""""""""""
noremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <ESC>:NERDTreeToggle<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeWinPos="left"
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrowExpandable='>'
let g:NERDTreeDirArrowCollapsible='v'

"""""""""""""""""""""""""""""""""
" Config nerdcommenter
"""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""
" Config ctrlp & ctrlp-funky
"""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
noremap <Leader>r :CtrlPMRUFiles<CR>
noremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"""""""""""""""""""""""""""""""""
" Config gundo
"""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 0
let g:gundo_preview_bottom = 1

"""""""""""""""""""""""""""""""""
" Config YankRing
"""""""""""""""""""""""""""""""""
nnoremap <silent> <F11> :YRShow<CR>

"""""""""""""""""""""""""""""""""
" Config UltiSnips
"""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<C-q>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsEditSplit="vertical"
let g:UntiSnipsListSnippets="<C-e>"

""""""""""""""""""""""""""""""
" Config tabular
""""""""""""""""""""""""""""""
if exists(":Tabularize")
    noremap <Leader>a= :Tabularize /=<CR>
    noremap <Leader>a: :Tabularize /:\zs<CR>
    noremap <Leader>a| :Tabularize /|<CR>
endif

""""""""""""""""""""""""""""""
" Config vim-expand-region
""""""""""""""""""""""""""""""
vnoremap K <Plug>(expand_region_expand)
vnoremap J <Plug>(expand_region_shrink)

"""""""""""""""""""""""""
" Config vim-bookmarks
"""""""""""""""""""""""""
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'
let g:bookmark_highlight_lines  = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" Finds the Git super-project directory.
function! g:BMWorkDirFileLocation()
    let filename = 'bookmarks'
    let location = ''
    if isdirectory('.git')
        " Current work dir is git's work tree
        let location = getcwd().'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', '.;')
    endif
    if len(location) > 0
        return location.'/.'.filename
    else
        return getcwd().'/.'.filename
    endif
endfunction

" Avoid keybinding conflicts with the Nerdtree.
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

"""""""""""""""""""""""""
" Config indentLine
"""""""""""""""""""""""""
let g:indentLine_char = '|'

"""""""""""""""""""
" Config tabman
"""""""""""""""""""
let g:tabman_toggle = '<F3>'
let g:tabman_focus  = '<leader>tf'
let g:tabman_width=25
let g:tabman_side='left'
let g:tabman_specials=0
let g:tabman_number=0

"""""""""""""""""""""""
" Config ConqueTerm
"""""""""""""""""""""""
nnoremap <F7> :ConqueTermSplit bash<CR>


"""""""""""""""""""""""
" Config vim-workspace
"""""""""""""""""""""""
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_persist_undo_history = 0
let g:workspace_autosave_always = 1
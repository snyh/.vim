call pathogen#incubate()
call pathogen#helptags()
call pathogen#infect()

" Sets how many lines of history VIM has to remember
set history=700
set autochdir

setlocal spell spelllang=en_us
hi SpellBad guisp=red gui=undercurl guifg=NONE guibg=NONE ctermfg=red ctermbg=NONE term=underline cterm=underline
hi SpellCap guisp=yellow gui=undercurl guifg=NONE guibg=NONE ctermfg=yellow ctermbg=NONE term=underline cterm=underline
hi SpellRare guisp=blue gui=undercurl guifg=NONE guibg=NONE ctermfg=yellow ctermbg=NONE term=underline cterm=underline
hi SpellLocal guisp=orange gui=undercurl guifg=NONE guibg=NONE ctermfg=yellow ctermbg=NONE term=underline cterm=underline

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursors - when moving vertical..
set so=7


set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching brackets when text indicator is over them
set mat=2 "How many tenths of a second to blink


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax highlight

set encoding=utf8

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in svn, git anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=8
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <C-L> <ESC>la
imap <C-H> <ESC>ha
imap <C-J> <ESC>ja
imap <C-K> <ESC>ka


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

""""""""""""""""""""""""""""""
" => C section
""""""""""""""""""""""""""""""
au FileType c nmap <buffer>  <F2> :!clear;tcc -run `pkg-config --libs-only-l --cflags-only-I gtk+-3.0 dbus-glib-1 gio-2.0 ` -lsqlite3 -lX11 -lXext -lxcb -lGLEW %<CR>

au FileType go nmap <buffer>  <F2> :!clear;go run %<CR>


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
"let python_highlight_all = 1
"let python_highlight_indent_errors = 0 
"let python_space_error_highlight = 0
au FileType python syn keyword pythonDecorator True None False self
au FileType python setlocal et sta sw=4 sts=4
au FileType python setlocal foldmethod=indent
au FileType python nmap <buffer>  <F2> :!clear;python2 %<CR>
au BufNewFile,BufRead *.cfg set syntax=python
nnoremap <space> za
vnoremap <space> zf
set foldlevelstart=99
set foldnestmax=2

au BufNewFile,BufRead *.coffee :set list

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

"au BufWritePost *.coffee silent make! -b | cwindow | redraw!
au BufWritePost *.coffee :!make >/dev/null

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""
" =>  rfc
"""""""""""""""""""""""""""""""
if expand('%:t') =~? 'rfc\d\+' 
    setfiletype rfc 
endif
nmap <leader>rfc :e /usr/share/doc/rfc/txt/rfc

nmap <leader>x :Tlist<cr>


source ~/.vim/autotag.vim


let g:ProjTags=["/home/snyh/.vimwork/"]

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls

    nmap <C-\>s :vert :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :vert :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :vert :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :vert :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :vert :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :vert :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :vert :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :vert :cs find d <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

    function! GENCS()
        silent! execute "!find `pwd` -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        silent! execute "!cscope -b"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endf
    silent! execute "cs add ~/.vim/cscope.out"
endif


let g:clang_auto_select=1
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
let g:clang_exec="clang"
let g:clang_user_options=""
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_use_library=1
"let g:clang_library_path="/directory/of/libclang.so/"
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>

let g:clic_filename="/database/src/webkit-1.9.4/Source/index.db"
nnoremap <Leader>r :call ClangGetReferences()<CR>
nnoremap <Leader>d :call ClangGetDeclarations()<CR>
nnoremap <Leader>s :call ClangGetSubclasses()<CR>




set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line

function! MyTabLine()
  let s = ''
  let t = tabpagenr()
  let i = 1
  while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let s .= '%' . i . 'T'
    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
    let bufnr = buflist[winnr - 1]
    let file = bufname(bufnr)
    let buftype = getbufvar(bufnr, 'buftype')
    if buftype == 'nofile'
      if file =~ '\/.'
        let file = substitute(file, '.*\/\ze.', '', '')
      endif
    else
      let file = fnamemodify(file, ':p:t')
    endif
    if file == ''
      let file = '[No Name]'
    endif
    let s .= string(i) . ":"
    let file = strpart(file, 0, 10)
    let s .= file
    let i = i + 1
  endwhile
  let s .= '%T%#TabLineFill#%='
  let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
  return s
endfunction

map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 10gt




function AutoCopyright()
    let l:base_line = line(".") - 1
    let l:company = "Deepin, Inc."
    let l:author = "Xia Bin"
    let l:author_email = "snyh@snyh.org"
    let l:maintainer = "Xia Bin"
    let l:maintainer_email = "snyh@snyh.org"
    let l:gpl_version = "3"

    call append(base_line + 0 ,"/*# Copyright (C) 2011 ~ 2012 " . l:company)
    call append(base_line + 1 ,"#               2011 ~ 2012 " . l:author)
    call append(base_line + 2 ,"#")
    call append(base_line + 3 ,"# Author: " . l:author . " <" . l:author_email . ">")
    call append(base_line + 4 ,"# Maintainer: " . l:maintainer . " <" . l:maintainer_email . ">")
    call append(base_line + 5 ,"#")
    call append(base_line + 6 ,"# This program is free software: you can redistribute it and/or modify")
    call append(base_line + 7 ,"# it under the terms of the GNU General Public License as published by")
    call append(base_line + 8 ,"# the Free Software Foundation, either version " . l:gpl_version . " of the License, or")
    call append(base_line + 9 ,"# any later version.")
    call append(base_line + 10,"#")
    call append(base_line + 11,"# This program is distributed in the hope that it will be useful,")
    call append(base_line + 12,"# but WITHOUT ANY WARRANTY; without even the implied warranty of")
    call append(base_line + 13,"# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the")
    call append(base_line + 14,"# GNU General Public License for more details.")
    call append(base_line + 15,"#")
    call append(base_line + 16,"# You should have received a copy of the GNU General Public License")
    call append(base_line + 17,"# along with this program. If not, see <http://www.gnu.org/licenses/>")
    call append(base_line + 18 ,"*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf

map <leader>d :!clear;git diff %<CR>
map <leader>bd :!clear;git diff base-version %<CR>

function! Sdcv()  
    let expl=system('sdcv -n ' .  
                \  expand("<cword>"))  
    windo if  
                \ expand("%")=="diCt-tmp" |  
                \ q!|endif  
    60vsp diCt-tmp  
    setlocal buftype=nofile bufhidden=hide noswapfile  
    1s/^/\=expl/  
    1  
endfunction  

nmap <C-k> :call Sdcv()<CR>

" load license personal settings
let g:T_AUTHOR = "snyh"
let g:T_AUTHOR_EMAIL = "snyh@snyh.org"
let g:T_DATE_FORMAT = "%c"

" maybe you need following settings to 
" fast input template information not defined
"  in formate of <+template+>
nnoremap <C-j> /<+.\{-1,}+><CR>c/+>/e<CR>
inoremap <C-j> <ESC>/<+.\{-1,}+><CR>c/+>/e<CR>

"let g:devhelpSearch=1
"let g:devhelpSearchKey = '<F1>'
"let g:devhelpAssistant=1
"set updatetime=150
"let g:devhelpWordLength = 5


set listchars=tab:>-,trail:-
set list

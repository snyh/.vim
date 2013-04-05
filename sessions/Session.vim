let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
map  h
map <NL> j
map  k
map  l
nmap d :vert :cs find d =expand("<cword>")	
nmap i :vert :cs find i ^=expand("<cfile>")$
nmap f :vert :cs find f =expand("<cfile>")	
nmap e :vert :cs find e =expand("<cword>")	
nmap t :vert :cs find t =expand("<cword>")	
nmap c :vert :cs find c =expand("<cword>")	
nmap g :vert :cs find g =expand("<cword>")	
nmap s :vert :cs find s =expand("<cword>")	
vnoremap   zf
nnoremap   za
vnoremap <silent> # :call VisualSearch('b')
vnoremap <silent> * :call VisualSearch('f')
nmap ,ihn :IHN
nmap ,is :IHS:A
nmap ,ih :IHS
nmap ,ca <Plug>NERDCommenterAltDelims
vmap ,cA <Plug>NERDCommenterAppend
nmap ,cA <Plug>NERDCommenterAppend
vmap ,c$ <Plug>NERDCommenterToEOL
nmap ,c$ <Plug>NERDCommenterToEOL
vmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
vmap ,cn <Plug>NERDCommenterNest
nmap ,cn <Plug>NERDCommenterNest
vmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
vmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
vmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
vmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
vmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
vmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
vmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
vmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
map ,0 10gt
map ,9 9gt
map ,8 8gt
map ,7 7gt
map ,6 6gt
map ,5 5gt
map ,4 4gt
map ,3 3gt
map ,2 2gt
map ,1 1gt
nnoremap ,s :call ClangGetSubclasses()
nnoremap ,d :call ClangGetDeclarations()
nnoremap ,r :call ClangGetReferences()
nnoremap ,q :call g:ClangUpdateQuickFix()
nmap ,x :Tlist
nmap ,rfc :e /usr/share/doc/rfc/txt/rfc
map ,u :TMiniBufExplorer
map ,o :BufExplorer
map ,p :cp
map ,n :cn
omap ,cc :botright cope
map ,cd :cd %:p:h
map ,tm :tabmove
map ,tc :tabclose
map ,te :tabedit
map ,tn :tabnew
map ,ba :1,300 bd!
map ,bd :Bclose
map ,g :vimgrep // **/*.<Left><Left><Left><Left><Left><Left><Left>
nmap ,w :w!
map 0 ^
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> gv :call VisualSearch('gv')
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
nmap <Nul>d :cs find d =expand("<cword>")	
nmap <Nul>i :cs find i ^=expand("<cfile>")$	
nmap <Nul>f :cs find f =expand("<cfile>")	
nmap <Nul>e :cs find e =expand("<cword>")	
nmap <Nul>t :cs find t =expand("<cword>")	
nmap <Nul>c :cs find c =expand("<cword>")	
nmap <Nul>g :cs find g =expand("<cword>")	
nmap <Nul>s :cs find s =expand("<cword>")	
map <Left> :bp
map <Right> :bn
imap  ha
inoremap 	 =SuperCleverTab()
imap <NL> ja
imap  ka
imap  la
imap ,ihn :IHN
imap ,is :IHS:A
imap ,ih :IHS
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set backspace=indent,eol,start
set cscopetag
set cscopeverbose
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set foldlevelstart=99
set grepprg=/bin/grep\ -nH
set guitablabel=%t
set helplang=en
set history=700
set hlsearch
set ignorecase
set incsearch
set matchtime=2
set nomodeline
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,~/.vim/bundle/sparkup,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set scrolloff=7
set shiftwidth=4
set showmatch
set showtabline=2
set smartcase
set smartindent
set smarttab
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set switchbuf=usetab
set tabline=%!MyTabLine()
set tabstop=4
set textwidth=500
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/deepin-webkit-1.8.2/Source/JavaScriptCore
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/deepin-webkit-1.8.2/Source/WebCore/ChangeLog
badd +1 ~/deepin-webkit-1.8.2/Source/JavaScriptCore/config.h
silent! argdel *
edit ~/deepin-webkit-1.8.2/Source/JavaScriptCore/config.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
set foldnestmax=2
setlocal foldnestmax=2
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=500
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

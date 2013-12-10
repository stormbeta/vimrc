"Primary .vimrc
let mapleader = ","    "<Leader> = ','
set nocompatible "Disable obsolete junk

"Load plugins{{{
   "call pathogen#infect() "Modular plugin directories!
   filetype off
   set rtp+=~/.vim/bundle/vundle
   call vundle#rc()
   set runtimepath^=~/.vim/bundle/ctrlp.vim

   "Vundle:
   Bundle 'Lokaltog/vim-easymotion'
   Bundle 'Valloric/YouCompleteMe'
   Bundle 'airblade/vim-gitgutter'
   Bundle 'croaker/mustang-vim'
   Bundle 'eiginn/netrw'
   Bundle 'gmarik/vundle'
   Bundle 'int3/vim-extradite'
   Bundle 'juanpabloaj/ShowMarks'
   Bundle 'kana/vim-arpeggio'
   Bundle 'kien/ctrlp.vim'
   Bundle 'mileszs/ack.vim'
   Bundle 'millermedeiros/vim-statline'
   Bundle 'rking/ag.vim'
   Bundle 'scrooloose/nerdcommenter'
   Bundle 'sjl/gundo.vim'
   Bundle 'tpope/vim-fugitive'
   Bundle 'tpope/vim-repeat'
   Bundle 'tpope/vim-surround'
   Bundle 'vim-scripts/camelcasemotion'
   Bundle 'vim-scripts/taglist.vim'
   Bundle 'altercation/vim-colors-solarized'
   Bundle 'tpope/vim-markdown'
   Bundle 'tpope/vim-sensible'

   "call showmarks#ShowMarks('global,enable') "Visual marks
   call arpeggio#load()   "Key chord binding!
"}}}

"Formating and Filetypes
filetype plugin indent on
au FileType * setlocal formatoptions-=o
au BufReadPost *.cup setlocal filetype=java
au BufReadPost *.as setlocal filetype=actionscript
au BufNewFile,BufRead *.gradle setf groovy
au BufNewFile,BufRead *.pp setf ruby

set colorcolumn=120

"GUI Options {{{
au GUIEnter * set lines=43 columns=95
if has('gui_running')
   colorscheme mustang
   set cursorline "highlights current line, looks terrible in console
   " set guifont=Monaco\ 12 "Warning: special font
   set guioptions-=T      "Disable toolbar
   set guioptions-=m      "Disable menubar
   set guioptions-=r    "Disable right scrollbar
   set guioptions-=L    "Disable left scrollbar
else "}}}
   "Console Options {{{
   "colorscheme relaxedgreen
   "colorscheme solarized
   "let g:solarized_termcolors=256
endif "}}}

"Sanity options{{{
   syntax on
   set backspace=indent,eol,start
   set t_kb=      "Set backspace key just in case system has weird default
   set ruler        "Character/line counts
   set mouse=a      "Ensure automatic mouse integration is enabled
   set background=dark "Ensure dark background type
   set nostartofline "Attempt to preserve cursor position
   set autoread      "Auto-update buffers if file is externally modified
   set hidden        "Make buffer switching work normally
   set showmode      "Ensure current mode is displayed
   set showcmd       "Display normal mode cmds in lower left
   set tildeop       "Ensure ~ behaves like an operator
   set list listchars=tab:→\ ,trail:· "Show trailing whitespace"
   set linebreak     "Don't split lines mid-word
   "Make Y behave like the other operator capitals
   noremap Y y$
"}}}

"Indent settings{{{
   set smartindent  "Automatic indenting
   set autoindent
   set tabstop=2    "Number of spaces a tab mimics
   set softtabstop=2 "Ensure spaces can be easily deleted
   set shiftwidth=2 "?
   set expandtab   "Enable for tabs to become spaces
"}}}

"Search options{{{
   set hlsearch   "Enable highlighting of matches
   set incsearch  "Enable incremental search
   set ignorecase "Ignore case when all lowercase
   set smartcase  "Otherwise enable case sensitivity
"}}}

"Misc options {{{
   set number
   if version >= 703
     set relativenumber "Relative line numbers
     set undofile       "Persistant undo history
     set undodir=~/.vim-backup
     set aw             "Autosave when appropriate (not 7.3 specific)
   endif
   set backupdir=~/.vim-backup
   " set number       "I like relative better
   set showmatch      "Flash matching parens
   set wildmenu       "Menubar
   set wildmode=list:longest
   set scrolloff=4    "Auto-scrolls screen near edges
   set updatetime=2000 "Affects visual marker indicators
   set modelines=0    "Modelines are security risk
   set viminfo='100,<50,s10,h,n~/.viminfo
   set diffopt+=iwhite "Ignore whitespace in diff mode
   "Go to last cursor position when reopening file
   au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ endif
"}}}

"Fold settings {{{
   "augroup vimrc
      "au BufReadPre * setlocal foldmethod=syntax
      "au BufWinEnter * setlocal foldmethod=marker
   "augroup END
   set foldmethod=syntax
   set foldlevel=6
   nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<Space>")<CR>
   au FileType vim set foldmethod=marker
   au FileType vim set foldlevel=0
"}}}

"Commands (ARPEGGIO) {{{
   "Arpeggio: Bindings (must come first)
   "Binding operator keys is bad idea =/
   "Arpeggio nnoremap ewr :Extradite<cr>
   " Arpeggio nnoremap qwe :NERDTreeToggle<cr>
   "Surround:
   Arpeggio nmap oi ysiw
   "Saving:
   Arpeggio nnoremap qwer :wq<cr>
   Arpeggio nnoremap qw :w<cr>
   Arpeggio inoremap qw <Esc>:w<cr>
   "EasyMotion:
   Arpeggio nnoremap we <Leader>w
   "Comment:
   call arpeggio#map('nv','',1,'re',',c ')
   "Arpeggio nnoremap fg [{zf]}
   "au FileType java Arpeggio imap ui <c-x><c-u>
   Arpeggio nnoremap /. :%!perl -pi -e 's//'<left><left>
   Arpeggio vnoremap /. :!perl -pi -e 's//'<left><left>
   "Buffers: mappings{{{
      "call arpeggio#map('nv','',0,
   "}}}
   Arpeggio inoremap kj <Esc>
   Arpeggio vnoremap kj <Esc>
   Arpeggio inoremap kl <c-n>
   Arpeggio inoremap KL <c-p>
   "inner word movement
   call arpeggio#map('nv','',1,'we',',w')
   call arpeggio#map('nv','',1,'WE',',b')
   Arpeggio nnoremap jh ``
   Arpeggio nnoremap nm :!make<cr>
   Arpeggio nnoremap NM :!make test<cr>


   "Zen Coding{{{
      " au FileType html,xml Arpeggio imap uio <c-y>,>
      "au FileType html,xml Arpeggio imap ui <c-y>,<cr><Esc>ko
      "au FileType html,xml Arpeggio imap uio <c-y>,
      " au FileType html,xml Arpeggio vmap ui <c-y>,
      "au FileType html,xml Arpeggio imap op <c-y>n
      "au FileType html,xml Arpeggio imap io <c-y>N
      "au FileType html,xml Arpeggio nmap re <c-y>/
   "}}}
"}}}

"Commands (Normal) {{{
   "Sane substitution
   vnoremap <Leader>/ :s/\%V/<Left>
   "nnoremap <Leader>/ :%s/\V/
   "Easier command entry
   nnoremap ; :
   vnoremap ; :
   nnoremap q; q:
   vnoremap q; q:
   "nnoremap <space> <cr>
   "CamelCaseMovement: Plugin
   omap ow i,w
   vmap ow i,w
   "These don't work?
   "omap oe i,e
   "omap ob i,b
   "Write file as markdown
    nnoremap <Leader>m :w<cr>:silent !Markdown.pl % > %.html<cr>

   "Sudo write:
   cmap w!! w !sudo tee > /dev/null %

   "This only works if the terminal is set correctly
   "Saves: and returns to command mode
   inoremap <c-s> <Esc>:w<cr>
   nnoremap <c-s> :w<cr>

   nnoremap <C-w>v <C-w>v<C-w>l
   "Clear searches
   nnoremap <Leader><space> :noh<CR>

   "Fugitive bindings (git)
   nnoremap <Leader>gw :Gwrite<cr>
   nnoremap <Leader>gc :Gcommit<cr>
   nnoremap <Leader>gC :Gcommit -a<cr>
   nnoremap <Leader>gd :Gdiff<cr>
   nnoremap <Leader>gvu :Git svn rebase<cr>
   "nnoremap <Leader>gx :Gedit<cr><C-w>h :bd<cr>
   nnoremap <Leader>gs :Gstatus<cr>
   nnoremap <Leader>gvc :Git svn dcommit<cr>
   nnoremap <Leader>gl :Extradite<cr>
   nnoremap <Leader>gb :Git branch<cr>
   nnoremap <Leader>gB :Git checkout 
   nnoremap <Leader>gu :Git fetch
   nnoremap <Leader>gp :Git pull

   "Like alt+tab, but for buffers
   nnoremap <silent> \ :bnext<cr>
   nnoremap <silent> <s-\> :bprev<cr>

   "Open: fuzzy matching
   nnoremap <Leader>o :CtrlP<CR>
   nnoremap <Leader>i :CtrlPTag<CR>
   nnoremap <Leader>p :CtrlPBuffer<CR>
   "let g:ctrlp_extensions = [ 'tag' ]
   "nnoremap <Leader>
   "Comment: toggle
   "nmap <Leader>, ,c 
   "vmap <Leader>, ,c 

   "Ack backup
   map <Leader>A :Ack 

   "Ag default
   let g:agprg="~/.utils/bin/ag --column"
   map <Leader>a :Ag 



   "EasyMotion:
   let g:EasyMotion_leader_key = '<Leader>w'

   " Repeat last command action?
   "inoremap <c-.> <Esc>:<c-p><cr>
   "nnoremap <c-.> <Esc>:<c-p><cr>

   "IDE MODE: ENGAGE
   "nnoremap <f2> :copen<cr>:TlistToggle<cr><c-w>k<c-w>v<c-w>l
   "nnoremap <f3> :vertical copen<cr>:TlistToggle<cr><c-w>h:split<cr>
   nnoremap <C-\> :tabn<cr>

   "Macros: {{{
   "}}}
"}}}

"Regex stuff {{{
  "Use normal regex behavior by default instead of literal matching
  "nnoremap / /\v
  "vnoremap / /\v
  set gdefault   "Set substitution to global default
"}}}

"Completion {{{
   "set completeopt+=longest,menu

   "au FileType java let g:neocomplcache_enable_at_startup=0
   "au FileType java call NeoComplCacheDisable()
   "let g:acp_enableAtStartup = 0
   "au FileType java let g:acp_enableAtStartup=0
   " autocmd BufRead,BufNew,FileWriteCmd call showmarks#ShowMarks('global,enable')
    "au FileType java let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    "autocmd FileType java let g:acp_behaviorUserDefinedFunction = "<c-x><c-u>"
   " autocmd FileType java let g:neocomplcache_enable_at_startup = 1
   " autocmd FileType java let g:acp_enableAtStartup = 1
   " let g:neocomplcache_enable_auto_select=1
   " autocmd FileType java setlocal omnifunc="<c-x><c-u>"
    "autocmd FileType java inoremap . .<c-x><c-u>
   "autocmd FileType java 
    au FileType xjb set filetype=xml
    au FileType cup set filetype=java
   " inoremap <a-j> <c-n>
   " inoremap <a-k> <c-p>

   " C++OmniCompl plugin settings
   " set tags+=~/.vim/tags/cpptags
   " let OmniCpp_NamespaceSearch = 1
   " let OmniCpp_GlobalScopeSearch = 1
   " let OmniCpp_ShowAccess = 1
   " let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
   " let OmniCpp_MayCompleteDot = 1 " autocomplete after .
   " let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
   " let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
   " let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
   " au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
   " set completeopt=menuone,menu,longest,preview
"}}}

"Movement {{{
   "Make searching center on results
   noremap n nzz
   noremap N Nzz
   "TODO check if quickfix window is open
   " Use the more accessible tab key to jump b/w brackets
   nmap <tab> %
   vmap <tab> %
   "Simplify window switching
   nnoremap <Leader>j <C-w>j
   nnoremap <Leader>k <C-w>k
   nnoremap <Leader>h <C-w>h
   nnoremap <Leader>l <C-w>l
   "Swap these, the ` version of the jump commands is much more useful than '
   nnoremap ` '
   nnoremap ' `
   "Remap pgup/pgdwn and home/end variants to convenient keys
   nnoremap <c-j> <c-d>
   nnoremap <c-k> <c-u>
   vnoremap <c-j> <c-d>
   vnoremap <c-k> <c-u>
   nnoremap <a-j> <c-d>
   nnoremap <a-k> <c-u>
   nnoremap <a-h> ^
   nnoremap <a-l> $
   nnoremap <c-h> ^
   nnoremap <c-l> $
   vnoremap <a-h> ^
   vnoremap <a-l> $
   vnoremap <c-h> ^
   vnoremap <c-l> $
   "Use 'screen' lines instead of 'file' lines for movement
   nmap j gj
   nmap k gk
   " inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
   nnoremap <silent>O :set paste<cr>m`O<esc>``:set nopaste<cr>
   " inoremap jj <Esc>
   " inoremap kk <Esc>
"}}}

"F-Key mappings {{{
   " map <f2> :execute Start_IDE()<CR>
   " map <f3> :execute Stop_IDE()<CR>
   nnoremap <F4> :GundoToggle<CR>
   nnoremap <F5> :NERDTreeToggle<CR>
   nnoremap <F6> :TlistToggle<CR>
   nnoremap <f8> :silent make<CR><C-l>
   inoremap <f8> <Esc>:silent make<CR><C-l>
   nnoremap <s-f8> :execute CCompile()<CR>
   inoremap <s-f8> <Esc>:execute CCompile()<CR>
   "Map F8 to make test target
   nnoremap <f7> :silent make test<CR><C-l>
   inoremap <f7> <Esc>:silent make test<CR><C-l>
   " nnoremap <f9> :VCSDiff<cr>
   " inoremap <f9> <Esc>:VCSDiff<cr>
   " nnoremap <S-f9> :VCSCommit<cr>
   " inoremap <S-f9> <Esc>:VCSCommit<cr>
"}}}

"autocmd FocusLost * :wa

" function! Increment()
"    let i=1 | '<,'>g/blah1/s//\="blah_".i/ | let i=i+1
" endfunction
" vnoremap <c-a> :execute Increment()<cr>
" nnoremap \ :tabn<cr>
" ConqueTerm options and bindings
" let g:ConqueTerm_InsertOnEnter = 1
" let g:ConqueTerm_CWInsert = 1
" Doesn't work properly

" let g:ConqueTerm_ReadUnfocused = 1
" This is only for python - it really ought to be changed into some kind of
" scripted function
" nnoremap <f4> :call conque_term#get_instance().writeln("run ".expand("%")." in")<cr>

let g:statline_show_encoding = 0

"Functions
" function! Start_IDE()
" 	:botright copen
" 	:TlistOpen
" 	execute "normal \<c-w>k"
" endfunction
" function! Stop_IDE()
" 	:TlistClose
" 	:cclose
" endfunction
function! CCompile()
	:!gcc -Wall -Wextra -g %
endfunction

"Single character insert without leaving normal mode!
function! RepeatChar(char, count)
	return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
" nnoremap S :<C-U>exec \"normal a\".RepeatChar(nr2char(getchar()), v:count1)<CR>


"The following was copied from the web, it adds automatic
"search and replace functionality via Ctrl+R in visual mode

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this -
" http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  "Put the current visual selection in the " register 
  normal! ""gvy
  let selection = getreg('"')
  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection

  let escaped_selection = EscapeString(selection)
  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vnoremap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/

"Not sure why these need to be at the bottom...
set t_Co=256
colorscheme mustang
highlight Normal ctermbg=none
highlight NonText ctermbg=none

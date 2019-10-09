"Primary .vimrc
if has("win32") || has("win16")
  "Required here or else this file will throw errors on windows
  scriptencoding utf-8
  set encoding=utf-8
endif

let mapleader = ","    "<Leader> = ','
set nocompatible "Disable obsolete junk

"Load plugins{{{
  filetype off

  "Required as there's no separate repo for the nginx vim settings
  set rtp+=~/.vim/plugged/nginx

  "Initialize vim-plug
  call plug#begin('~/.vim/plugged')

  "TODO: Unsure if this is still needed
  set runtimepath^=~/.vim/plugged/ctrlp.vim

  "vim-plug:

  "Special
  Plug 'kana/vim-arpeggio'
  "Plug 'AndrewRadev/switch.vim'

  "Project and workspace
  Plug 'kien/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  Plug 'rking/ag.vim'
  Plug 'scrooloose/nerdtree'

  "Source control
  Plug 'tap349/vim-extradite'
  Plug 'tpope/vim-fugitive'

  "Misc / uncategorized
  Plug 'mhinz/vim-signify'
  "Causes problems with buffer swapping
  "Plug 'juanpabloaj/ShowMarks'
  Plug 'scrooloose/nerdcommenter'
  "Plug 'sjl/gundo.vim' " No longer maintained :(
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/taglist.vim'
  Plug 'tpope/vim-sensible'
  Plug 'yegappan/mru'
  Plug 'tpope/vim-dispatch'
  Plug 'junegunn/vim-easy-align'
  Plug 'editorconfig/editorconfig-vim'

  "Movement and textobj
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'

  Plug 'vim-scripts/camelcasemotion'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'reedes/vim-textobj-sentence'

  "Theming/UI
  "NOTE: airline is pretty slow even with the performance tweaks enabled
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  Plug 'mkitt/tabline.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'altercation/vim-colors-solarized'

  "Syntax highlighting
  Plug 'kchmck/vim-coffee-script'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'PProvost/vim-ps1'
  Plug 'vim-scripts/applescript.vim'
  Plug 'markcornick/vim-vagrant'
  Plug 'derekwyatt/vim-scala'
  Plug 'guns/vim-clojure-highlight'
  Plug 'davidzchen/vim-bazel'
  Plug 'rust-lang/rust.vim'
  Plug 'hashivim/vim-terraform'
  Plug 'elixir-lang/vim-elixir'
  Plug 'tpope/vim-markdown'
  Plug 'zimbatm/haproxy.vim'
  "Causes massive performance issues
  "Plug 'chr4/sslsecure.vim'
  Plug 'saltstack/salt-vim'
  Plug 'elmcast/elm-vim'
  Plug 'b4b4r07/vim-hcl'
  Plug 'udalov/kotlin-vim'
  Plug 'vim-scripts/groovyindent-unix'
  Plug 'elubow/cql-vim'
  Plug 'cespare/vim-toml'

  "Integrated Development / Language support
  "For stuff that goes beyond mere syntax highlighting
  Plug 'fatih/vim-go'             " Golang
  Plug 'google/vim-jsonnet'       " Jsonnet autoformat/linting
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-db'
  "Plug 'slashmili/alchemist.vim' " Elixir
  "Plug 'tpope/vim-fireplace'     " Clojure
  "Plug 'racer-rust/vim-racer'    " Rust
  Plug 'vim-syntastic/syntastic'

  "Version dependent
  if version >= 704
    Plug 'ajh17/VimCompletesMe'
    " YouCompleteMe requires manual installation
    "Plug 'Valloric/YouCompleteMe'

    " NOTE: I think this might be baked into vim now
    Plug 'eiginn/netrw'
  endif

  if version <= 703
    Plug 'ervandew/supertab'
  endif

  "Specials
  if has('macunix')
    "Required to make autoread/autoreload actually work on macOS
    Plug 'djoshea/vim-autoread'
    "Disable swap warning on macOS since we have autoread enabled
    set shortmess+=A
  endif

  if has('gui_running')
    "This is awful except in the GUI
    Plug 'joeytwiddle/sexy_scroller.vim'
    "⌘ can only be bound in a GUI application
    vnoremap <D-/> ,c
    nnoremap <D-/> ,c
  endif

  if $KEYBOARD_LAYOUT == "Colemak"
    Plug 'jooize/vim-colemak'
  endif

  call plug#end()

  "call showmarks#ShowMarks('global,enable') "Visual marks
  call arpeggio#load()   "Key chord binding!
"}}}

if $KEYBOARD_LAYOUT == "Colemak"
  nmap ; p
  nmap y o
endif

let mapleader = ","    "<Leader> = ','

"Formating and Filetypes {{{
  filetype plugin indent on
  au BufReadPost *.cup setlocal filetype=java
  au BufReadPost *.as setlocal filetype=actionscript
  au BufReadPost *.eyaml setlocal filetype=yaml
  au BufReadPost *.gradle setlocal filetype=groovy
  au BufReadPost *.conf.tmpl setlocal filetype=nginx
  au BufReadPost Jenkinsfile setlocal filetype=groovy
  au BufReadPost Jenkinsfile.* setlocal filetype=groovy
  au BufReadPost .ansible-lint setlocal filetype=yaml
  au BufReadPost *.jenkinsfile setlocal filetype=groovy
  au BufReadPost *.cfg setlocal filetype=haproxy
  au BufReadPost *.cfg.erb setlocal filetype=haproxy
  au BufReadPost *.ctmpl setlocal filetype=gotexttmpl
  au BufReadPost *.libjsonnet setlocal filetype=jsonnet
  au BufNewFile,BufRead *.pp setf ruby
  au FileType go setlocal noexpandtab list listchars=tab:\ \ ,trail:· "Show trailing whitespace"
"}}}

"GUI Options {{{
au GUIEnter * set lines=43 columns=95
if has('gui_running')
  "colorscheme vividchalk
  set cursorline         "highlights current line, looks terrible in console
  set guioptions-=T      "Disable toolbar
  set guioptions-=m      "Disable menubar
  set guioptions-=r      "Disable right scrollbar
  set guioptions-=L      "Disable left scrollbar
  set relativenumber     "Relative line numbers

  "Windows-only options
  if has("win32") || has("win16")
    set guifont=Source\ Code\ Pro:h10
    set guioptions+=m
    set guioptions+=r
  elseif has('gui_macvim')
    "set guifont=Source\ Code\ Pro\ for\ Powerline:h20
    set guifont=Iosevka\ Term:h15
  endif
endif " }}}

"Clipboard settings{{{
  "Ensure vim uses system clipboard (tested on OSX)
  "Note that linux needs +xterm_clipboard feature compiled in
  "Works in Windows and OSX!
  if has('nvim')
    " NOTE: this is also the correct setting for IdeaVim, but you'll need to
    " set it in ~/.ideavimrc directly as IdeaVim doesn't understand if/else
    set clipboard=unnamedplus
  else
    "NOTE: add autoselect to make visual selection auto-copy
    "      I removed it because it annoyed me when trying to replace a
    "      highlighted region with something from the clipboard
    set clipboard=unnamedplus,unnamed
  endif
"}}}

"Switch {{{
"}}}

"Behavior preferences{{{
  syntax on
  set backspace=indent,eol,start
  set t_kb=         "Set backspace key just in case system has weird default
  set ruler           "Character/line counts
  set mouse=a         "Ensure automatic mouse integration is enabled
  set nostartofline   "Attempt to preserve cursor position
  set autoread        "Auto-update buffers if file is externally modified
  set hidden          "Make buffer switching work normally
  set showmode        "Ensure current mode is displayed
  set showcmd         "Display normal mode cmds in lower left
  set tildeop         "Ensure ~ behaves like an operator
  set list listchars=tab:→\ ,trail:· "Show trailing whitespace"
  set linebreak       "Don't split lines mid-word
  set showtabline=2   " Always show tabline
  "Make Y behave like the other operator capitals
  noremap Y y$
  "Bash only - fixes spurious stdout/stderr output from some plugins
  let &shellpipe="&>"

  let g:syntastic_sh_checkers = ['shellcheck']

  "Regex {{{
    "Use normal regex behavior by default instead of literal matching
    "nnoremap / /\v
    "vnoremap / /\v
    set gdefault   "Set substitution global flag by default
  "}}}

"}}}

"Theme and color settings{{{
  "Only enable for generating promptline snapshot
  "colorscheme solarized
  "set t_Co=256
  "let g:solarized_termcolors=256

  "Automatically use dark/light background
  let hour = strftime("%H") " Set the background light from 7am to 7pm
  if 7 <= hour && hour < 19
    set background=light
  else " Set to dark from 7pm to 7am
    set background=dark
  endif
  "if $ITERM_PROFILE == "Light"
    "set background=light
  "else
    "set background=dark
  "endif

  "Theme:
  colorscheme solarized

  "General:
  set t_Co=256

  "Lightline:
  let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

  "Airline:
  "let g:airline_powerline_fonts = 1
  "let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#tabline#left_sep = ' '
  "let g:airline#extensions#tabline#left_alt_sep = '|'
  ""let g:airline_theme='solarized'
  ""Airline Performance workarounds
  "let g:airline_highlighting_cache = 1
  "let g:airline_theme='dark_minimal'

  "Allows transparent terminal background to persist within vim
  "highlight Normal ctermbg=none
  "highlight NonText ctermbg=none

  "Enable italics if custom terminfo available
  "See: https://github.com/stormbeta/bashrc/blob/master/home/.bashrc#L7
  if $TERM =~ "italic"
    highlight Comment cterm=italic
  endif
  highlight Todo cterm=underline
"}}}

"Indent settings{{{
  set smartindent   "Automatic indenting
  set autoindent
  set tabstop=2     "Number of spaces a tab mimics
  set softtabstop=2 "Ensure spaces can be easily deleted
  set shiftwidth=2  "?
  set expandtab     "Enable for tabs to become spaces
  let g:jsonnet_fmt_options = '--indent 2'
"}}}

"Search options{{{
  set hlsearch   "Enable highlighting of matches
  set incsearch  "Enable incremental search
  set ignorecase "Ignore case when all lowercase
  set smartcase  "Otherwise enable case sensitivity
"}}}

"Misc options {{{
  set number           "Relative is too slow except in the GUI
  if version>=703
    set undofile        "Persistant undo history
    set undodir=~/.vim-backup
    set autowrite       "Autosave when appropriate
    set colorcolumn=120 "highlight column indicated
  endif
  set backupdir=~/.vim-backup
  set dir=~/.vim-backup
  set showmatch       "Flash matching parens
  set wildmenu        "Menubar
  set wildmode=list:longest
  set scrolloff=4     "Auto-scrolls screen near edges
  set sidescrolloff=5 "Auto-scrolls screen near horizontal
  set updatetime=2000 "Affects visual marker indicators e.g. git status
  set modelines=0     "Modelines are a security risk
  set diffopt+=iwhite "Ignore whitespace in diff mode

  "Auto-formatting
  set textwidth=100    " Set wrap width for gq, auto-wrap comments
  set formatoptions-=t " Disable auto-wrapping text (unless part of a comment)
  "Disable o/O from assuming new line should be a comment when next to a comment
  "This must be set via autocommand as many plugins alter formatoptions
  au FileType * setlocal formatoptions-=o

  "Go to last cursor position when reopening file
  au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") |
   \ exe "normal! g`\"" |
   \ endif

  "nvim info file is incompatible
  if ! has('nvim')
    set viminfo='100,<50,s10,h,n~/.viminfo
  endif
"}}}

"Fold settings {{{
  "augroup vimrc
    "au BufReadPre * setlocal foldmethod=syntax
    "au BufWinEnter * setlocal foldmethod=marker
  "augroup END
  set foldmethod=syntax
  set foldlevel=6
  "nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<Space>")<CR>
  au FileType vim set foldmethod=marker
  au FileType vim set foldlevel=0
"}}}

"Commands (Normal) {{{
  nnoremap vv V
  vnoremap <Space> G

  "Undotree
  nnoremap <Leader>u :UndotreeToggle<CR>

  "Sane substitution
  vnoremap <Leader>/ :s/\%V/<Left>
  nnoremap <Leader>/ q/
  vmap <enter> <Plug>(EasyAlign)

  "Easier command entry
  nnoremap ; :
  vnoremap ; :
  " TODO: I don't think I ever use q: as I rarely enter vim commands directly
  nnoremap q; q:
  vnoremap q; q:

  "Single character replace
  nnoremap s i_<ESC>r

  "Don't leave visual mode while shifting indents
  vnoremap < <gv
  vnoremap > >gv

  "CamelCaseMovement: Plugin
  omap ow i,w
  vmap ow i,w
  "These don't work?
  "omap oe i,e
  "omap ob i,b

  "Sudo write:
  cmap w!! w !sudo tee > /dev/null %

  "This only works if the terminal is set correctly
  "Saves: and returns to command mode
  inoremap <c-s> <Esc>:w<cr>
  nnoremap <c-s> :w<cr>

  "Open new pane to the right
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
  nnoremap <silent> \ :bn<cr>
  nnoremap <silent> <s-\> :bc<cr>
  nnoremap <silent> <c-\> :tabn<cr>
  nnoremap <silent> <c-s-\> :tabp<cr>

  "Open: fuzzy matching with CtrlP / MRU
  nnoremap <Leader>o :CtrlP<cr>
  nnoremap <Leader>O :CtrlPBuffer<cr>
  nnoremap <Leader>i :CtrlPTag<cr>
  nnoremap <Leader>P :MRU<cr>
  nnoremap <Leader>p :CtrlPMRUFiles<cr>
  "let g:ctrlp_extensions = [ 'tag' ]
  "Comment: toggle
  "nmap <Leader>, ,c
  "vmap <Leader>, ,c

  "Ag/Ack config
  "let g:ackpreview=1
  let g:ackhighlight=1
  let g:ack_use_dispatch=1
  "let g:ack_autoclose=1
  if executable('ag')
    let g:ackprg="ag --column --nocolor --nogroup"
    map <Leader>a :Ack
    set grepprg=ag\ --nogroup\ --nocolor

    "TODO: Consider mapping file list from git where possible
    "See http://kien.github.io/ctrlp.vim/
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    "let g:ctrlp_use_caching = 0
  else
    let g:ackprg="ack-grep --nocolor --nogroup --column"
    map <Leader>a :Ack
    set grepprg=ack-grep\ --nogroup\ --nocolor\ --no-binary
  endif

  "Use grep command instead of man page
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  "EasyMotion:
  "let g:EasyMotion_leader_key = '<Leader>w'
  "map <Leader>r <Plug>(easymotion-prefix)

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
  "nnoremap <silent>O :set paste<cr>m`O<esc>``:set nopaste<cr>
  " inoremap jj <Esc>
  " inoremap kk <Esc>
"}}}

" NOTE: HERE BE DRAGONS BELOW

"Commands (ARPEGGIO) {{{
  "Arpeggio: Bindings (must come first)
  "Binding operator keys is bad idea =/
  "Arpeggio nnoremap ewr :Extradite<cr>
  " Arpeggio nnoremap qwe :NERDTreeToggle<cr>
  "Surround:
  Arpeggio nmap oi ysiw
  "Saving:
  "Arpeggio nnoremap qwer :wq<cr>
  Arpeggio nnoremap qw :w<cr>
  Arpeggio inoremap qw <Esc>:w<cr>
  "Arpeggio nnoremap we :Switch<cr>
  Arpeggio nmap we ysiW
  "EasyMotion:
  "Arpeggio nnoremap we <Leader>w
  "Arpeggio nmap df <Plug>(easymotion-bd-w)
  Arpeggio nmap df <Plug>(easymotion-prefix)
  "Comment:
  call arpeggio#map('nv','',1,'re',',c ')
  "Arpeggio nnoremap fg [{zf]}
  "au FileType java Arpeggio imap ui <c-x><c-u>
  Arpeggio nnoremap /. :%!perl -pe 's//'<left><left>
  Arpeggio vnoremap /. :!perl -pe 's//'<left><left>
  "Buffers: mappings{{{
    "call arpeggio#map('nv','',0,
  "}}}
  Arpeggio inoremap kj <Esc>
  Arpeggio vnoremap kj <Esc>

  "avoid excessive use of shift
  Arpeggio inoremap l; :
  Arpeggio inoremap ;' "
  Arpeggio inoremap f9 (
  Arpeggio inoremap f0 )
  Arpeggio inoremap kl <Esc>:w<cr>
  "Arpeggio nnoremap lk :w<cr>

  "inner word movement
  "call arpeggio#map('nv','',1,'we',',w')
  "call arpeggio#map('nv','',1,'WE',',b')
  "Arpeggio nnoremap jh ``

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

"Completion {{{
  "TODO: Revisit these settings
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

"Old F-Key mappings {{{
  "nnoremap <F5> :NERDTreeToggle<CR>
  "nnoremap <F6> :TlistToggle<CR>
  "nnoremap <f8> :silent make<CR><C-l>
  "inoremap <f8> <Esc>:silent make<CR><C-l>
  "nnoremap <s-f8> :execute CCompile()<CR>
  "inoremap <s-f8> <Esc>:execute CCompile()<CR>
  "Map F8 to make test target
  "nnoremap <f7> :silent make test<CR><C-l>
  "inoremap <f7> <Esc>:silent make test<CR><C-l>
  " nnoremap <f9> :VCSDiff<cr>
  " inoremap <f9> <Esc>:VCSDiff<cr>
  " nnoremap <S-f9> :VCSCommit<cr>
  " inoremap <S-f9> <Esc>:VCSCommit<cr>
"}}}

let g:statline_show_encoding = 0

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
"}}}

" Start the find and replace command across the entire file
vnoremap <C-r> <Esc>:%s/<c-r>=GetVisual()<cr>/

" Source: https://github.com/easymotion/vim-easymotion README
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and somtimes want to move cursor with
" EasyMotion.
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

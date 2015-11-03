"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Markdown vim
Bundle 'plasticboy/vim-markdown'
"rainbow vim
"youcompleteme vim
Bundle 'Valloric/YouCompleteMe'

" Language syntax/indent/compile etc
" One pack for all !!!
Plugin 'sheerun/vim-polyglot'

Plugin 'pangloss/vim-javascript'

Bundle 'luochen1990/rainbow'

Plugin 'bling/vim-airline'

Plugin 'mbbill/undotree'

Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic settings  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=utf-8,gb18030,big5,euc-jp,latin1
set encoding=utf-8
language messages zh_TW.UTF-8
set guifont=Monaco\ 16

colorscheme molokai
let g:molokai_original = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='murmur'
let g:git_branch_status_head_current=1

syntax on
set term=xterm-256color
"set term=screen-256color
set t_Co=256
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set backspace=2
set cindent shiftwidth=2
set ai!
set mouse=a
set ruler
set incsearch
set hlsearch
set nowrapscan
set nu
set autoindent
set autoread
set showmatch
set cursorline
set tags=tags;
set autochdir
set noswf
set foldmethod=marker " use {{{ }}} to fold
set cmdheight=2 "The commandbar height
set showcmd
set showmode "display current mode
let mapleader=","

if !has("unix")
  set guioptions-=a
endif

source $VIMRUNTIME/mswin.vim
behave mswin

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html':0,
\       'css': 0,
\   }
\}

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=~/.vim/tagfiles
noremap <F5> :YcmForceCompileAndDiagnostics<CR>
inoremap <F5> <ESC>:YcmForceCompileAndDiagnostics<CR>
autocmd! BufWritePost * silent YcmForceCompileAndDiagnostics

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['foo', 'bar', 'hs'],
                           \ 'passive_filetypes': ['cpp', 'c'] }

"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Haskell Mode( Abandoned ) {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"filetype plugin on
"au BufEnter *.hs compiler ghc
"let g:haddock_browser="/usr/bin/google-chrome"

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F4> :UndotreeToggle<CR>
map! <F4> :UndotreeToggle<CR>
imap <F4> <ESC>:UndotreeToggle<CR>
vmap <F4> <ESC>:UndotreeToggle<CR>

map  <F5> :call DefineCode()<CR>
map! <F5> :call DefineCode()<CR>
imap  <F5> <ESC>:call DefineCode()<CR>
vmap <F5> <ESC>:call DefineCode()<CR>

map <F6> :NERDTreeToggle<CR>
map! <F6> :NERDTreeToggle<CR>
imap <F6> <ESC>:NERDTreeToggle<CR>
vmap <F6> <ESC>:NERDTreeToggle<CR>

map  <F7> :TagbarToggle<CR>
map! <F7> :TagbarToggle<CR>
imap <F7> <ESC>:TagbarToggle<CR>
vmap <F7> <ESC>:TagbarToggle<CR>
 
map  <F8> :call Compile()<CR>
map! <F8> :call Compile()<CR>
imap <F8> <ESC>:call Compile()<CR>
vmap <F8> <ESC>:call Compile()<CR>


map  <C-Left> :tabp<CR>
map! <C-Left> :tabp<CR>
imap <C-Left> <ESC>:tabp<CR>
vmap <C-Left> <ESC>:tabp<CR>

map  <C-Right> :tabn<CR>
map! <C-Right> :tabn<CR>
imap <C-Right> <ESC>:tabn<CR>
vmap <C-Right> <ESC>:tabn<CR>

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func! Compile()
    exec "w"
    if &filetype == "cpp"
        exec "!g++ -Wall -Wshadow -O2 -std=c++14 % -o %<"
    elseif &filetype == "c"
        exec "!clang -Wall -Wshadow -O2 -std=c99 % -o %< 2>log.txt"
    elseif &filetype == "tex"
        exec "!xelatex % -output-directory=\"C:%<\\..\""
    elseif &filetype == "haskell"
      exec "!ghc --make %"
    endif
endfunc

 
func! DefineCode()
    if &filetype == "cpp"
        r ~/work/codes/sample.cpp
    elseif &filetype == "haskell"
        r ~/work/codes/sample.hs
    endif
endfunc

"}}}

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'tmhedberg/SimpylFold'
" Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
" Plugin 'kien/ctrlp.vim'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let python_highlight_all=1
syntax on

set t_Co=256

:nmap <C-t> :NERDTreeToggle<CR>
:nmap ; :
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR>
nnoremap <C-n> :noh<CR>

" yank to clipboard
" set clipboard=unnamed,unnamedplus
set clipboard=unnamedplus,autoselect,exclude:cons\\\\|linux

" make backspace work
:set backspace=indent,eol,start

:colorscheme jellybeans

" Send more characters for redraws
set ttyfast

set ttymouse=xterm2
set mouse=a
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" PEP8 indentation
au BufNewFile,BufRead *.test set tabstop=4
      \softtabstop=4
      \shiftwidth=4
      \textwidth=790
      \expandtab
      \autoindent
      \fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, *.wppl
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

augroup filetypedetect
    au BufRead,BufNewFile *.wppl set filetype=javascript
augroup END

set encoding=utf-8
set term=screen-256color

let g:airline#extensions#tabline#enabled = 0
let airline_theme='raven'

" linting config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

" more sensible splits navigation and creation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" always show status bar
:set laststatus=2
" allow buffer switch without save
:set hidden

" you complete me config
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

:set noswapfile

filetype off
filetype plugin indent on
filetype plugin on

set nocompatible
set nocp

set nu
set modelines=0

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
nnoremap ; :

au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>p "+gP
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>h o<ESC>79i-<ESC>o


nnoremap <leader>c :Javac
nnoremap <leader>r :Java

inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <F2> :retab <CR> :wq! <CR>
nmap <silent> <C-N> :silent noh<CR>

colorscheme delek
syntax on

:com -range Cz :silent :<line1>,<line2>w !xsel -i -b
:com -range Cx :silent :<line1>,<line2>w !xsel -i -p
:com -range Cv :silent :<line1>,<line2>w !xsel -i -s
:ca cv Cv
:ca cz Cz
:ca cx Cx

:com -range Pz :silent :r !xsel -o -b
:com -range Px :silent :r !xsel -o -p
:com -range Pv :silent :r !xsel -o -s

:ca pz Pz
:ca px Px
:ca pv Pv

" Slimv - Superier Lisp Interaction Mode for Vim
"let g:slimv_swank_clojure = '! lein swank &'
"let g:slimv_swank_cmd = '! lein swank &'

" Start NERDTree on startup
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

set listchars=eol:⇃,tab:→\ ,trail:↤,extends:>,precedes:<
set list

" Set the proper tab / whitespace handling for a given programming language
if has("autocmd")
  " enable file type search
  filetype plugin on
  " use filetype indent
  filetype indent on
    " Consistent with the Linux Kernel Coding Style Guidelines
    autocmd FileType go,c,cpp,opencl  set noexpandtab tabstop=8 shiftwidth=8 textwidth=78
    autocmd FileType css,sass,html  set noexpandtab tabstop=8 shiftwidth=8 textwidth=78
    autocmd FileType python,lua set expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
    autocmd FileType lisp,clisp,cl,elisp,clj set expandtab tabstop=2 shiftwidth=2 softtabstop=2 textwidth=79
endif

" add spacebar insert single char
:nmap <Space> i_<Esc>r

" Automatically call flake8 on write.
"autocmd BufWritePost *.py call Flake8()

" Pathogen
execute pathogen#infect()

" Syntastic
let g:syntastic_python_checkers=['flake8']

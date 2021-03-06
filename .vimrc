
" Disable vi compatibility
set nocompatible

" Indentation
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0

" Visual goodies
set backspace=2
set number " Line numbers

" Hide some command line info
set noruler
set noshowmode

set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 " Keep 5 lines at the size
set showmatch " Show matching brackets
syntax enable " Enable syntax highlighting without overriding color preferences

set t_Co=256
let g:solarized_termcolors=256

if has('gui_running')
	set background=light
else
	set background=dark
endif

"colorscheme solarized
colorscheme wombat256

set hidden " Hide buffers instead of closing them

" Plugins
filetype plugin indent on

" Safe work
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/temp " This directory is used to store temporal/swap files.

set viminfo='10,\"100,:20,%,n~/.vim/viminfo
if has( 'autocmd' )
	autocmd BufReadPost *
		\ if line( "'\"" ) > 1 && line( "'\"" ) <= line( '$' ) |
			\ exe "normal! g'\"" |
		\ endif

	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif

" Character encoding
set encoding=utf-8
set fileencoding=utf-8

" Search
set incsearch
set hlsearch
set ignorecase " Case insensitive by default
set smartcase " If there are caps, go case-sensitive

source ~/.vim/mapping.vim

set tags=./tags,tags

set wildignore+=*/tmp/*,*/temp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|bower_components$\|node_modules$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links'
  \ }

" Show status line
set laststatus=2

set statusline+=%#warningmsg#
if exists('SyntasticStatuslineFlag')
	set statusline+=%{SyntasticStatuslineFlag()}
endif
set statusline+=%*

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_mode_map = { 'passive_filetypes': ['c'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_python_exec = 'python3'

set listchars=tab:>-,eol:$
set nolist

au BufRead,BufNewFile *.twig set filetype=htmljinja
au BufRead,BufNewFile *.nasm set filetype=nasm
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.plt set filetype=gnuplot
au BufRead,BufNewFile *.gv set filetype=dot
au BufNewFile,BufRead Jenkinsfile setf groovy

let NERDTreeIgnore = ['\.lo$', '\.o$', '\.pyc', '\.map', '\.git']
let g:NERDTreeShowHidden = 1


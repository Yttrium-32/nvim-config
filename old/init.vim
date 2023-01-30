"-------------------------------|Vim Plug|-------------------------------"
call plug#begin()

" Surround text with stuff
Plug 'tpope/vim-surround'

" Better syntax support
Plug 'sheerun/vim-polyglot'

" Iceberg colorscheme
Plug 'cocopon/iceberg.vim'

" Conqueror of all completion
Plug 'neoclide/coc.nvim', {'branch':'release'}

" Status line plugin
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

" Markers
"Plug 'kshenoy/vim-signature'

" Auto pairing for '(' '[' and '{'
Plug 'jiangmiao/auto-pairs'

" Colorise hex codes and color names
Plug 'chrisbra/colorizer'

" Comment out lines
Plug 'scrooloose/nerdcommenter'

" Tree explorer
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

"-------------------------------|All Other config|-------------------------------"

set fileformat=unix
set encoding=utf-8
set number relativenumber
filetype on
filetype indent on
filetype plugin on
" Setting colorscheme to iceberg
colorscheme iceberg
" Make backspace delete indent, end of line and start of line
set backspace=indent,eol,start

" Setting colorscheme background and sidebar to transparent
"hi Normal guibg=NONE ctermbg=NONE
"highlight clear LineNr
"highlight clear SignColumn

" set leader key to space
let mapleader = " "

" enable the mouse
set mouse=a

" copy to and from vim
set clipboard+=unnamedplus

" Enable syntax hightlighting 
syntax enable

" Keep space at the bottom of file
set scrolloff=5

" Highlight color and color names
:let g:colorizer_auto_color = 1

" Set colorscheme for statusbar
"let g:lightline = {'colorscheme': 'iceberg'}
let g:airline_colorscheme="iceberg"

if (has("termguicolors"))
		set termguicolors
endif

" Quit nerdtree when file is opened
let NERDTreeQuitOnOpen=1

" Open nerdtree with f2
nmap <F2> :NERDTreeToggle<CR>

" Make nerdtree's ui more minimal
let g:NERDTreeMinimalUI=1

" Tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemode=":t"
nmap <C-Right> :bn<CR>
nmap <C-Left> :bp<CR>
nmap <C-w> :bd<CR>

" Coc.nvim configuration
source $HOME/.config/nvim/coc-config.vim



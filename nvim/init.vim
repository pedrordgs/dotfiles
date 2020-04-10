syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader =","

"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Syntastic
Plugin 'vim-syntastic/syntastic'

"Complete
"Plugin 'valloric/youcompleteme'
Plugin 'ervandew/supertab'

"Displays which mode you are on
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"GODS PLUGIN
Plugin 'cohama/lexima.vim'
Plugin 'tpope/vim-surround'

"Haskell highlight
Plugin 'neovimhaskell/haskell-vim', {'for': ['haskell', 'hs']}

"Elixir highlight
Plugin 'elixir-lang/vim-elixir'

"i3 highlight
Plugin 'potatoesmaster/i3-vim-syntax'

"Fuzzy file finder
Plugin 'kien/ctrlp.vim'
Plugin 'powerline/fonts'

Plugin 'morhetz/gruvbox'
Plugin 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp', 'c']}

Plugin 'scrooloose/nerdtree'
Plugin 'gyim/vim-boxdraw'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'dag/vim2hs'
Plugin 'cool.vim'
Plugin 'drtom/fsharp-vim'

call vundle#end()

set bg=dark
colorscheme gruvbox

filetype plugin indent on
set termguicolors
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.
set hlsearch
set ignorecase              " Ignores case sensitive cases when searching
set undofile

set scrolloff=5             " Start scrolling n lines before horizontal
"   border of window.
set sidescrolloff=7         " Start scrolling n chars before end of screen.
set sidescroll=1            " The minimal number of columns to scroll
"   horizontally.
set wildmenu                " Hitting TAB in command mode will
set wildchar=<TAB>          "   show possible completions.
set wildmode=list:longest
set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set softtabstop=2               " Tab key results in # spaces
set tabstop=2                   " Tab is # spaces
set shiftwidth=2                " The # of spaces for indenting.
set smarttab                    " At start of line, <Tab> inserts shift width

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set guicursor=                  " Enable block cursor in nvim

" gvim and xsel needed
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-x> "+d

"Airline config
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline_section_z=''
let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_section_gutter=''
let g:airline_skip_empty_sections = 1
let g:airline_section_x=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:bufferline_echo = 0
let g:airline#extensions#tabline#tab_nr_type = 1


"Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
map <leader>w :SyntasticCheck<CR>
map <leader>e :SyntasticReset<CR>
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"Tabular
let g:tabular_loaded = 1

"Save with Ctrl-S
noremap  <silent> <C-S>         :w<CR>
vnoremap <silent> <C-S>         <ESC>:w<ESC><CR>
inoremap <silent> <C-S>         <ESC>:w<CR>

" Quick quit command
noremap <leader>q :quit<CR>
noremap <leader>Q :qa!<CR>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Keep terminals transparency
hi Normal guibg=NONE ctermbg=NONE

"  Scrolling tabs
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
map <leader>t :tabnew<CR>
nnoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m <esc>:tabnext<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Easier way to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" NerdTree
map <C-z> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'



" Unbind arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Resize splits
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>_ :resize -5<CR>
nnoremap <leader>* :resize +5<CR>

" Navigating with guides
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
map <leader><Tab> <Esc>/<++><Enter>"_c4l

" Latex bindings
autocmd FileType tex map <F10> :silent !pdflatex % && start %:r.pdf<CR>
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i


" Define flex filetype
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.fl   set filetype=lex
augroup END

" Define prolog filetype
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.pl   set filetype=prolog
augroup END



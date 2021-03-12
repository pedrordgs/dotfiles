syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader =","

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'neovimhaskell/haskell-vim', {'for': ['haskell', 'hs']}
Plug 'dag/vim2hs', {'for': ['haskell', 'hs']}
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'alexeyignatiev/vim-dimacs'
Plug 'bohlender/vim-smt2'


call plug#end()

set bg=dark
colorscheme gruvbox

filetype plugin indent on
set termguicolors
set number                  " Enable line numbers.
set numberwidth=5           " width of numbers line (default on gvim is 4)
set rnu                     " Set relative number
set report=0                " Show all changes.
set showmode                " Show the current mode.
set showcmd                 " show partial command on last line of screen.
set showmatch               " show matching parenthesis
set splitbelow splitright   " how to split new windows.
set title                   " Show the filename in the window title bar.
set hlsearch
set ignorecase              " Ignores case sensitive cases when searching
set undofile
set hidden                  " Change buffers without needing to save
set updatetime=300          " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
                            " delays and poor user experience.

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

" Providers needed to coc
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

" Airline config
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

" Syntastic config
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


" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> <Leader>gd <Plug>(coc-definition)
nmap <silent> <Leader>gy <Plug>(coc-type-definition)
nmap <silent> <Leader>gi <Plug>(coc-implementation)
nmap <silent> <Leader>gr <Plug>(coc-references)


" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Keep terminals transparency
hi Normal guibg=NONE ctermbg=NONE

" Scrolling tabs
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

" fzf
nnoremap <C-p>     :Files<CR>
nnoremap <Leader>b :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Goyo
map <leader>f :Goyo \| :hi Normal guibg=NONE ctermbg=NONE <CR>

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
" autocmd FileType tex map <F10> :silent !pdflatex % && start %:r.pdf<CR>
" autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
" autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
" autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
"
autocmd FileType dimacs inoremap ,or ∨
autocmd FileType dimacs inoremap ,and ∧
autocmd FileType dimacs inoremap ,no ¬
autocmd FileType dimacs inoremap ,s →
autocmd FileType dimacs inoremap ,eq ≡

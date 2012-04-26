" .vimrc
"
"""
""" CrypticSwarm's Vim Configuations
"""
"
" A large portion of these come from Bill Odom's repo
" (https://github.com/wnodom/wnodom-vim-environment/blob/master/.vimrc)
"
set nocompatible

set autoindent          " Copy indent from current line for new line.
set nosmartindent       " 'smartindent' breaks right-shifting of # lines.

set hidden              " Keep changed buffers without requiring saves.
set ruler               " Always show the cursor position.
set showcmd             " Display incomplete commands.
set number              " Display line numbers.
set numberwidth=4       " Minimum number of columns to show for line numbers.
set laststatus=1        " Always show a status line.
set visualbell t_vb=    " Use null visual bell (no beeps or flashes).

set scrolloff=3         " Context lines at top and bottom of display.
set sidescrolloff=5     " Context columns at left and right.
set sidescroll=1        " Number of chars to scroll when scrolling sideways.
set backspace=indent,eol,start  " Backspace over everything in Insert mode

" Tab Related
set expandtab           " Insert spaces for <Tab> press; use spaces to indent.
set smarttab            " Tab respects 'shiftwidth', 'tabstop', 'softtabstop'.
set tabstop=2           " Set the visible width of tabs.
set softtabstop=2       " Edit as if tabs are 2 characters wide.
set shiftwidth=2        " Number of spaces to use for indent and unindent.
set shiftround          " Round indent to a multiple of 'shiftwidth'.

" Search Related
set incsearch           " Do incremental searching.
set hlsearch            " Highlight latest search pattern.
set ignorecase          " Ignore case for pattern matches (\C overrides).
set smartcase           " Override 'ignorecase' if pattern contains uppercase.

set nocursorline        " Don't highlight the current screen line...
set nocursorcolumn      " ...or screen column...


"Buffer related configs
set hidden " allow hidden buffers
set splitright " open vsp to the right
set splitbelow " open sp to the below

" Enable mouse support if it's available.
if has('mouse')
  set mouse=a
endif


" Startup Pathogen!
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype off
filetype plugin indent on

syntax on
if has('gui_running')
  colorscheme underwater-mod
endif

let mapleader = ","

" Source the vimrc file after saving it {{{
augroup vimrc
  if has("autocmd")
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd bufwritepost .vimrc source $MYVIMRC
  endif
augroup end
" }}}

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""" KeyBindings

" Jump from insert into normal mode
inoremap kj <ESC>

" Window resize
nnoremap <leader>+ <C-w>5+
nnoremap <leader>- <C-w>5-
nnoremap <leader>< <C-w>5<
nnoremap <leader>> <C-w>5>

" Custom movement commands
nnoremap <leader>l $
nnoremap <leader>h ^
onoremap <leader>l $
onoremap <leader>h ^
vnoremap <leader>l $
vnoremap <leader>h ^

" No idea what this was about
nnoremap <leader>qn :nunmap <leader>wj<ENTER> :nnoremap <leader>wj <C-V><C-w>j<C-V><C-w>_<ENTER> :nunmap <leader>wk<ENTER> :nnoremap <leader>wk <C-V><C-w>k<C-V><C-w>_<ENTER>
nnoremap <leader>qf :nunmap <leader>wj<ENTER> :nnoremap <leader>wj <C-V><C-w>j<ENTER> :nunmap <leader>wk<ENTER> :nnoremap <leader>wk <C-V><C-w>k<ENTER>

" Window Movements
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wL <C-w>L
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wH <C-w>H
nnoremap <leader>wr <C-w>r

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nmap <leader>vc :tabedit $MYVIMRC<CR>
nmap <leader>vt :tabedit
map <leader>vs :sp
nmap <leader>vv :vsp
nnoremap <C-h> <C-left>
nnoremap <C-l> <C-right>
nnoremap ; :
nnoremap <leader>s :syntax on<CR>
nnoremap <leader>ns :syntax off<CR>




nnoremap <leader>c zfa{
nnoremap <F9> :set expandtab<ENTER>:retab<ENTER>

let vimclojure#HighlightBuiltins = 1


" Toggles the hidden characters
nnoremap <leader>[ :set list!<CR>

" Built in file browser
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_preview=1 " preview window shown in a vertically split

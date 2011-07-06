set nocompatible

" Startup Pathogen!
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype off
filetype plugin indent on

let mapleader = ","
" Source the vimrc file after saving it
 if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
 endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=3
set ignorecase
set smartcase
set smartindent
set incsearch
syntax on
if has('gui_running')
  colorscheme underwater-mod
endif

inoremap kj <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nmap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <C-h> <C-left>
nnoremap <C-l> <C-right>
nnoremap ; :
nnoremap <leader>s :syntax on<CR>
nnoremap <leader>ns :syntax off<CR>

nnoremap <leader>l $
nnoremap <leader>h ^
onoremap <leader>l $
onoremap <leader>h ^
vnoremap <leader>l $
vnoremap <leader>h ^

nnoremap <leader>qn :nunmap <leader>wj<ENTER> :nnoremap <leader>wj <C-V><C-w>j<C-V><C-w>_<ENTER> :nunmap <leader>wk<ENTER> :nnoremap <leader>wk <C-V><C-w>k<C-V><C-w>_<ENTER>
nnoremap <leader>qf :nunmap <leader>wj<ENTER> :nnoremap <leader>wj <C-V><C-w>j<ENTER> :nunmap <leader>wk<ENTER> :nnoremap <leader>wk <C-V><C-w>k<ENTER>
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wL <C-w>L
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wH <C-w>H
nnoremap <leader>wr <C-w>r

nnoremap <leader>+ <C-w>5+
nnoremap <leader>- <C-w>5-
nnoremap <leader>< <C-w>5<
nnoremap <leader>> <C-w>5>
nnoremap <leader>c zfa{
nnoremap <F9> :set expandtab<ENTER>:retab<ENTER>
let clj_highlight_builtins = 1

let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_preview=1 " preview window shown in a vertically split

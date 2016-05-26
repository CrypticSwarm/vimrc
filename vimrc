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

" Set the hidden chars
set listchars=tab:▸\ ,eol:¬
set iskeyword+=-
set iskeyword+=/

set hidden              " Keep changed buffers without requiring saves.
set ruler               " Always show the cursor position.
set showcmd             " Display incomplete commands.
set number              " Display line numbers.
set numberwidth=4       " Minimum number of columns to show for line numbers.
set laststatus=2        " Always show a status line.
set visualbell t_vb=    " Use null visual bell (no beeps or flashes).
set t_ut=               " disable background erase some terminals seem to have this set by default which messes with color schemes

set history=10000       " Default history is too too small.

set scrolloff=3         " Context lines at top and bottom of display.
set sidescrolloff=5     " Context columns at left and right.
set sidescroll=1        " Number of chars to scroll when scrolling sideways.
set backspace=indent,eol,start  " Backspace over everything in Insert mode

" Tab Key Related
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
set virtualedit=block   " Virtual edit when in visual block mode

set wildmenu              " Use menu when autocompleting
set wildmode=longest,full " Use bash style for first tab, then wildmenu for double

" Buffer related configs
set hidden     " allow hidden buffers
set splitright " open vsp to the right
set splitbelow " open sp to the below
set diffopt+=vertical

set tags=./tags,tags;$HOME " Walk up from current directory to the $HOME looking for tag files

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

" Color scheme from: (http://www.vim.org/scripts/script.php?script_id=1807)
colorscheme calmar256-dark

" Source the vimrc file after saving it {{{
augroup vimrc
  if has("autocmd")
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWritePost .vimrc source $MYVIMRC
  endif
augroup end
" }}}


augroup resizeWindow
  if has("autocmd")
    autocmd!
    autocmd VimResized * exe "normal \<C-W>="
  endif
augroup end

nmap <leader>p :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

""" KeyBindings

" Both of these are pretty dangerous mappings.
" Lose our on the short search forward and backward repeats.
" Used these for too long...
let mapleader = ","
nnoremap \ ,
" nnoremap ; :

" Jump from insert into normal mode
inoremap kj <ESC>

" Window resize
nnoremap <leader>+ <C-w>5+
nnoremap <leader>- <C-w>5-
nnoremap <leader>< <C-w>5<
nnoremap <leader>> <C-w>5>

" Custom movement commands
" noremap <leader>l $
" noremap <leader>h ^

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

nnoremap <leader>f :Lexplore<CR>

" Command Line Movement
cnoremap <C-a> <C-b>

" I used to commonly mistype and press F1 instead of Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nmap <leader>vc :tabedit $MYVIMRC<CR>
nmap <leader>vt :tabedit
map <leader>vs :sp
nmap <leader>vv :vsp
nnoremap <left> :bprev<cr>
nnoremap <right> :bnext<cr>
nnoremap <up> :cnext<cr>
nnoremap <down> :cprev<cr>

" Toggle search highlighting. Sometimes it gets annoying when doing
" searches for movement
nnoremap <silent> <leader>/ :nohlsearch<cr>

" Toggle syntax highlighting on and off.
" Useful for long lines
nnoremap <leader>st :call ToggleSyntax()<cr>
function! ToggleSyntax()
  if exists("g:syntax_on") | syntax off | else | syntax enable | endif
endfunction
nnoremap <leader>ss :set spell!<cr>

nnoremap <leader>c zfa{
nnoremap <F9> :set expandtab<ENTER>:retab<ENTER>

" Toggles the hidden characters
nnoremap <silent> <leader>[ :set list!<CR>

" Fugitive Bindings prefix -> <leader>g 
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gr :Gread<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gl :Glog

" Built in file browser
let g:netrw_banner=0
let g:netrw_winsize= -35
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_preview=1 " preview window shown in a vertically split

vnoremap . :normal .<cr>

" Tmux key bindings

nnoremap <leader>r :SlimuxREPLSendLine<CR>
nnoremap <leader>e vip:SlimuxREPLSendSelection<CR>
vnoremap <leader>r :SlimuxREPLSendSelection<CR>
nnoremap <leader>aa :SlimuxShellLast<CR>
nnoremap <leader>ai :SlimuxShellPrompt<CR>

" Screen or Tmux key fix for arrows
if &term =~ '^screen'
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"

endif

" Lame fix for mac sucking at copy and pasting doesn't work inside tmux :(
function! MacCopy() range
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy')
endfunction

" Markdown underline command
inoremap <C-U>- <Esc>yypVr-ja
inoremap <C-U>= <Esc>yypVr=ja

" Make page up and down work in insert mode
inoremap <C-f> <C-o><C-f>
inoremap <C-b> <C-o><C-b>

" via http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" See http://xkcd.com/149/
command! Makemeasandwich :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! E :execute ':Explore'

augroup vim_filtype
  autocmd!
  autocmd VimEnter * :if argc() is 0 | Explore | endif
  autocmd BufRead,BufNewFile *.hjs set filetype=html
  autocmd BufRead,BufNewFile *.jpg,*.png,*.gif set filetype=image
  autocmd FileType image call system('git web--browse ' . shellescape(expand('%:p'))) | bd
augroup end

" Use <C-L> to clear the highlighting of :set hlsearch and reset diffs
" Pulled from tpope's vim-sensible
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Syntastic config
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol ='⚠'

let g:ackprg = 'ag --nogroup --nocolor --column'

nmap <leader>uu ysiw)iObservable.unpack<esc>

autocmd FileType cpp setlocal iskeyword-=-

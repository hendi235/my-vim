" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

if has('win32')
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" On Windows, also use '.vim' first instead of 'vimfiles'; this makes
" synchronization across (heterogeneous) systems easier.
set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$HOME/.vim/after,$VIM/vimfiles/after

" Use vundle for easy plugin administration
" ----- vundle START -----
filetype off  " required for Vundle!

if has("gui_running") 
" If you want gvim portable as well vundle to load from vimfiles,
" then you've to edit the $HOME in bundle/vundle/autoload/vundle.vim, too.
" I won't bother, so let it managed by default in .vim folder.
  "set rtp+=%HOME%/.vim/bundle/vundle/
  set rtp+=$HOME/.vim/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif

call vundle#rc()

" let Vundle manage Vundle. required!
Plugin 'gmarik/vundle'

" My bundles start here
" more colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" fuzzy file searching
Plugin 'kien/ctrlp.vim'

" minibufexplorer is more pleasant, use it!
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'corntrace/bufexplorer'

" Match coupled tags/parenthesis
Plugin 'jwhitley/vim-matchit'

" Use silver searcher for search (https://github.com/ggreer/the_silver_searcher)
Plugin 'rking/ag.vim'

" FLEX specific convinience
Plugin 'hendi235/vim-flex'

filetype plugin on    " required!
filetype indent on    " required!
" ----- vundle END -----


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Set global color theme
"-- zenburn --
"let g:zenburn_high_Contrast=1
"colors zenburn
"
"-- inkpot --
"let g:inkpot_black_background = 1
"colors inkpot
"
"-- solarized --
let g:solarized_contrast="normal"
colorscheme solarized

if has("gui_running")
    " Set global font
    set guifont=consolas:h11:cDEFAULT

    " Set toolbar to hidden --> gvim specific
    set guioptions-=T

    " display horizontal scrollbar at bottom
    set guioptions+=b

    " try to start gVim in full window size
    au GUIEnter * simalt ~x

    " Set initial windows size (column and lines)
    "set lines=50
    "set columns=120
endif

"Disable virtual bell
set vb t_vb="

"Make backspace work
set backspace=2

" keep xx lines of command line history
set history=100

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" do incremental searching
set incsearch

" ignore case in searching
set ignorecase

" case-sensitive search only if searchword contains uppercase letter
"set smartcase

" don't wrap searching at the end of file
set nowrapscan

set smartindent

" show line number
set nu

" no annoying word wrapping
set textwidth=0

" don't wrap at end of window
set nowrap

set tabstop=2

set shiftwidth=2

" convert TAB into spaces 
set expandtab

" autoset syntax highlight according to filetype
filetype on

" allow vim to manage multiple buffers effectively
set hidden

" command completion only up to the point of ambiguity (while still showing you what your options are)
set wildmenu 
set wildmode=list:longest

" more scrolling when cursor goes out of window
set scrolloff=3

" scroll viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" allow backspacing over everything in insert mode
set bs=indent,eol,start

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Enable matchit macro
"runtime macros/matchit.vim    "but now we use vundle to cleanly manage matchit

" =============================== 
" Remapping key start from here 
" ===============================
" Toggle fullscreen mode with plugin gvimfullscreen (http://www.vim.org/scripts/script.php?script_id=2596)
"nmap <silent> <F3> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

" change <leader> key to 'comma', easier to reach
let mapleader = ","

" easy window movement using Ctr + <movementkey>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-up> <C-w>k
nnoremap <C-down> <C-w>j
nnoremap <C-right> <C-w>l
nnoremap <C-left> <C-w>h

" Toggle BufferExplorer
"nmap <leader>b :BufExplorer<CR>

" Toggle NERD-Tree with F7
"nmap <F7> :NERDTreeToggle<CR>
" or use this, but not both!
"map <leader>nt :NERDTreeToggle<CR>

" Ack {
  nmap <leader>a <Esc>:Ack!
" }

" Ag {
" note: Remember to install Ag first and can be found in PATH
" }

" ctrlP {
  " start ctrlP (see http://kien.github.com/ctrlp.vim/)
  nmap <leader>cp :CtrlP<CR>

  " ctrlP with word under cursor
  nn <silent> <leader>cc :let g:ctrlp_default_input = expand('<cword>')<cr>:CtrlP<cr>

  " another method of ctrlP with word under cursor. Let's see between the two. But don't activate both !
  "nmap <leader>dd :CtrlP<CR><C-\>w

  " ctrlP with selected word
  vmap <leader>cw :CtrlP<CR><C-\>c
" }

" MiniBufExplorer {
  map <Leader>mbt :MBEToggle<cr>

  " swich forward buffer(s) in current window
  noremap <C-TAB>   :MBEbf<CR>
  
  " switch backwad buffer
  noremap <C-S-TAB> :MBEbb<CR>

  " delete current buffer
  nmap <leader>md :MBEbd<CR>
" }

" toggle background mode
call togglebg#map("<F5>")

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" On Windows, also use '.vim' instead of 'vimfiles'; this makes
" synchronization across (heterogeneous) systems easier.
if has('win32')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Use vundle for easy plugin administration
" ----- vundle START -----
filetype off  " required!

if has("gui_running") 
" If you want gvim portable as well vundle to load from vimfiles,
" then you've to edit the $HOME in bundle/vundle/autoload/vundle.vim, too.
" I won't bother, let it managed by default in .vim folder.
  set rtp+=%HOME%/.vim/bundle/vundle/
else
  set rtp+=~/.vim/bundle/vundle/
endif

call vundle#rc()

" let Vundle manage Vundle. required!
Bundle 'gmarik/vundle'

" My bundles start here

Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'jwhitley/vim-matchit'
Bundle 'hendi235/vim-syntax'

filetype plugin indent on     " required!
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

" case-sensitive search if searchword contains uppercase letter
set smartcase

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

" already set when using Vundle, no need to set again
"filetype plugin on

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
nnoremap <C-h> <C-w>h
nnoremap <C-up> <C-w>j
nnoremap <C-down> <C-w>k
nnoremap <C-right> <C-w>l
nnoremap <C-left> <C-w>h

" Toggle BufferExplorer
nmap <leader>b :BufExplorer<CR>

" Toggle NERD-Tree with F7
nmap <F7> :NERDTreeToggle<CR>
"map <leader>nt :NERDTreeToggle<CR>

" start Ack
nmap <leader>a <Esc>:Ack!

" start ctrlp (see http://kien.github.com/ctrlp.vim/)
nmap <leader>ct :CtrlP<CR>

" toggle background mode
call togglebg#map("<F5>")

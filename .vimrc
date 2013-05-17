" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Windows Compatible {
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
    " across (heterogeneous) systems easier.
    if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" }

    " Setup Bundle Support {
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()

" let Vundle manage Vundle. required! 
Bundle 'gmarik/vundle'
    " }


" Bundles {
"Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp'
" }

" General {

    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=100                    " Store a ton of history (default is 20)
"    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Setting up the directories {
        set backup                  " Backups are nice ...
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif
    " }
" }

" Vim UI {

    set background=dark         " Assume a dark background 

    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        color solarized                 " Load a colorscheme
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high
    else
        let g:zenburn_high_Contrast=1
        colors zenburn
    endif
   
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

"    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    " allow backspacing over everything in insert mode
    set backspace=indent,eol,start  " Backspace for dummies

    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
"    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

    " Syntax coloring lines that are too long just slows down the world
    set synmaxcol=2048

    " disable virtual bell
    set vb t_vb="
" }

" Formatting {

    set nowrap                      " Wrap long lines
"    set autoindent                  " Indent at the same level of the previous line
    set smartindent
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
 
" }

" Key (re)Mappings {

    " The default leader is '\', but many people prefer ',' 
        let mapleader = ','

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " Stupid shift key fixes
"        if has("user_commands")
"            command! -bang -nargs=* -complete=file E e<bang> <args>
"            command! -bang -nargs=* -complete=file W w<bang> <args>
"            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
"            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
"            command! -bang Wa wa<bang>
"            command! -bang WA wa<bang>
"            command! -bang Q q<bang>
"            command! -bang QA qa<bang>
"            command! -bang Qa qa<bang>
"        endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
"    cnoremap %% <C-R>=expand('%:h').'/'<cr>
"    map <leader>ew :e %%
"    map <leader>es :sp %%
"    map <leader>ev :vsp %%
"    map <leader>et :tabe %%

    " Adjust viewports to the same size
"    map <Leader>= <C-w>=

    " scroll viewport faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

" }

" Plugins {

    ctrlp {
        let g:ctrlp_working_path_mode = 2
        nmap <C-p> :CtrlP<CR>
"        nnoremap <silent> <D-t> :CtrlP<CR>
"        nnoremap <silent> <D-r> :CtrlPMRU<CR>
"        let g:ctrlp_custom_ignore = {
"            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
"            \ 'file': '\.exe$\|\.so$\|\.dll$' }
"
"        let g:ctrlp_user_command = {
"            \ 'types': {
"                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
"                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"            \ },
"            \ 'fallback': 'find %s -type f'
"        \ }
    }


    " UndoTree {
"        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
"        let g:undotree_SetFocusWhenToggle=1
    " }
" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar

        " display horizontal scrollbar at bottom
        set guioptions+=b

        set lines=40                " 40 lines of text instead of 24
        if has("gui_gtk2")
            set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
        elseif has("gui_mac")
            set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
        elseif has("gui_win32")
            "set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h11,Courier_New:h10
            set guifont=consolas:h11:cDEFAULT
        endif

        if has('gui_macvim')
            set transparency=5      " Make the window slightly transparent
        endif
        
        " try to start gVim in full window size
        au GUIEnter * simalt ~x
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif

" }

" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " To disable the stripping of whitespace, add the following to your
        " .vimrc.local file:
        "   let g:spf13_keep_trailing_whitespace = 1
        if !exists('g:spf13_keep_trailing_whitespace')
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endif
    endfunction
    " }

" }

" Finish local initializations {
"    call InitializeDirectories()
" }

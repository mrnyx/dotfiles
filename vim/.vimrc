""===============================
"" basic settings
""=============================== 

syntax enable
set nocompatible
filetype off

" vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" BUNDLES
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'

Bundle "lepture/vim-css"

" replaces obsolete smart tab
set cindent

" highlight current line, the same as cursorline
set cul

" line numbers
"set number

" relative line numbers
set relativenumber
" show current position at bottom
set ruler

" show invisible characters
"set list

" but only show tabs and trailing whitespace
"set listchars=tab:>·,trail:·

set showmode
" display incomplete commands
set showcmd

set encoding=utf-8
" load file type plugins + indentation
filetype plugin indent on

" set the cursor at same indent as line above
set autoindent
" show matching brackets
set showmatch
" keep at least 5 lines around the cursor   
set scrolloff=5
" show vertical line on 80th column
set colorcolumn=80

" yank/delete/copy directly to X11 clipboard 
set clipboard=unnamedplus

""===============================
"" background & colorscheme & font
""=============================== 

"set guifont=Inconsolata-g\ 10
" set guifont=DejaVu\ Sans\ Mono\ 10

set background=dark
"colorscheme obsidian
"colorscheme zenburn 
"colorscheme solarized 
"let g:molokai_original=1

" change solorscheme style depending on current time
" current hour
""let hour=system('date +%H')
""if hour >= 6 && hour <= 22
""    " day style
""    let g:lucius_style='light'
""else
""    " night style
""    let g:lucius_style='dark'
""endif

"" default colorscheme
""colorscheme lucius
colorscheme Tomorrow-Night-Eighties

" better colors in the terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" change status line in different modes (insert/normal)
" first, enable status line always
"set laststatus=2
"
"" now set it up to change the status line based on mode
"if version >= 700
"  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"endif

" highlight current line depending on the mode
"hi CursorLine ctermbg=green cterm=none
"au InsertEnter * set cursorline
"au InsertLeave * set nocursorline

""===============================
"" whitespace
""=============================== 

" spaces for each step of (auto)indent
set shiftwidth=4
" set virtual tab stop (compat for 8-wide tabs)
set softtabstop=4
" use spaces instead of tabs
set expandtab

" use existing indents for new indents
set copyindent

" save as much indent structure as possible
set preserveindent

" backspace through everything in insert mode
set backspace=indent,eol,start

" don't wrap lines
""set nowrap
set wrap
set textwidth=0 
set wrapmargin=0

""===============================
"" searching
""=============================== 

set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

""===============================
"" backup & source management options
""=============================== 

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

""===============================
"" maps
""=============================== 

" change : to ; so I don't need to use SHIFT key all the time
map ; :

" change the leader from \ to ,
let mapleader=","

" Ctrl+F1 shows/hide menu bar
" nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR> 

" F2 sets light/dark style
""map <F2> :call ChangeStyle()<CR>

" on/off wrapping lines when pressing F5
map <F5> :set nowrap! <CR>

" ESC clears search highlighting
" causes garbage characters on startup in normal mode in terminal!!!
"nnoremap <esc> :noh<return><esc>

" clears highlightling after hiting another enter
nnoremap <CR> :noh<CR><CR>


" toggle between relative number and regular line lumbering
nnoremap <C-L> :call g:ToggleNuMode()<cr>

" maps C-e to turn on/off NerdTree
map <C-e> :NERDTreeToggle<CR>

""===============================
"" custom syntax options
""=============================== 

" arduino syntax highlighting, association with .ino files
" autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

""===============================
"" custom functions definitions
""===============================

" toggle between light/dark lucius style
""function! ChangeStyle()
""    if(g:lucius_style == 'dark')
""        let g:lucius_style='light'
""        colorscheme lucius
""    else
""        let g:lucius_style='dark'
""        colorscheme lucius
""    endif
""endfunction

" use Ctrl+L to toggle the line number counting method
    function! g:ToggleNuMode()
    	if(&rnu == 1)
        	    set nu
	else
		set rnu
	endif
    endfunc

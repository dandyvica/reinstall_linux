set nocompatible
filetype off

"--------------------------------------------------------------
" vundle install
"--------------------------------------------------------------
if has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
elseif has("win32")
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$VIM/vimfiles/bundle/')
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"--------------------------------------------------------------
" my plugins
" taken from http://vimawesome.com/
"--------------------------------------------------------------
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'altercation/vim-colors-solarized'
Plugin 'https://github.com/vim-scripts/Align'
Plugin 'scrooloose/nerdTree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------------------------------------------
" specific to powerline
"--------------------------------------------------------------
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
let g:Powerline_symbols = 'compatible'

"--------------------------------------------------------------
" specific to markdown
"--------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

"--------------------------------------------------------------
" colorscheme solarized is working in GUI mode
" set font and size also
"--------------------------------------------------------------
if has("gui_running")
    echom "GUI running!"
    set background=dark
    colorscheme solarized
    " set font
    if has("gui_macvim")
        echom "MacVim running!"
        set guifont=Monaco:h24
    endif
else
    " colorscheme changing at evening
    if strftime("%H") > 20
        colorscheme delek
    else
        colorscheme darkblue
    endif
endif

"--------------------------------------------------------------
"--------------------------------------------------------------
set smartindent
set ignorecase
set ruler

" show a visual line under the cursor's current line 
set cursorline

" highlight column
set cursorcolumn

" do not wrap long lines
set nowrap

" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" highlight search patterns
set hlsearch

" highlight current line
hi CursorLine cterm=bold ctermbg=red ctermfg=white


"--------------------------------------------------------------
" my shortcuts
"--------------------------------------------------------------
":nmap <C-a> ggVG
:nmap <C-d> yyp

" useful for tabs
:nmap <C-Right> gt
:nmap <C-Left> gT

" for split
:nmap <C-Up> <C-W>Up

" to align CPP comments
:vmap <C-:> \acom
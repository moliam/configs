set nocompatible " be iMproved, required
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'tczengming/autoload_cscope.vim'

call vundle#end()
filetype plugin indent on

nmap <w> :w<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-f> :Leaderf function<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1


syntax on

set tags=tags;
set autochdir

set number
set tabstop=8
set shiftwidth=8
set listchars=tab:>\ ,trail:@
set incsearch
set statusline+=%F
set hlsearch

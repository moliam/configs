set nocompatible              " be iMproved, required
filetype off                  " required

"call plug#begin('~/.vim/plugged')

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

call vundle#begin()
Plugin 'davidhalter/jedi-vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'scrooloose/nerdtree'
"Plugin 'majutsushi/tagbar'
Plugin 'Chiel92/vim-autoformat'
"Plugin 'itchyny/landscape.vim'
Plugin 'jlanzarotta/bufexplorer'
call vundle#end()
"call plug#end()

filetype plugin indent on

"setlocal cindent
setlocal cinoptions=:0,l1,t0,t0,(0
set autoindent
set number
syntax on
set incsearch
set hlsearch
"set softtabstop=8
"set shiftwidth=8
set listchars=tab:>-,trail:@,extends:#,nbsp:-
set background=dark
set laststatus=2

set list
hi SpecialKey guifg=darkgrey ctermfg=darkgrey

hi Pmenu  ctermbg=grey
"hi PmenuSel  guifg=#FFFF00  guibg=#FF3F3F gui=NONE
hi PmenuSel   ctermfg=White   ctermbg=Blue cterm=Bold guifg=White
hi NonText ctermfg=247 guifg=#a73111 cterm=bold gui=bold
"hi PmenuThumb guifg=grey20 guibg=#3FFF3F gui=NONE

"colorscheme molokai
"set showmatch
set showcmd 
nnoremap <C-\> <C-]>
nmap <F8> :TagbaqrToggle<CR>
nmap <C-f> :LeaderfFunction<CR>
nmap <C-z> :LeaderfFile<CR>
nmap <C-l> gt:f<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

nmap <C-h> gT:f<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
" for Chinese encoding
set fileencodings=utf-8,gbk

" hmcopyright
function! HMBANNER()
        0r ~/.vim/templates/hmcopyright
        language time en_US.UTF-8
        exe "%s/@TIMESTAMP@/" . strftime("%a %b %d %H:%M:%S %Y"). "/g"
endfunction
autocmd BufNewFile      *.c call HMBANNER()
autocmd BufNewFile      *.h call HMBANNER()

"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() 

let g:python_recommended_style = 0
let g:formatdef_custom = '"astyle --options=none --lineend=linux --mode=c --style=linux --indent=force-tab=8 --indent-preprocessor --indent-col1-comments --attach-namespaces --attach-classes --attach-inlines --attach-extern-c --min-conditional-indent=0 --max-instatement-indent=80 --pad-oper --pad-header --unpad-paren --align-pointer=name --align-reference=name --max-code-length=80 --break-after-logical"'
let g:formatters_cpp = ['custom']
let g:formatters_c = ['custom']
" au BufWrite *.cc,*.hh,*.c,*.h :Autoformat
noremap <F5> :Autoformat<CR>
autocmd FileType python set tabstop=8 | set autoindent
autocmd FileType C set tabstop=8 | set expandtab | set autoindent
set noexpandtab

cscope add xxx
"cscope add xxx
command -nargs=+ S :cs find s <args>
command -nargs=+ C :cs find c <args>
command -nargs=+ G :cs find g <args>
noremap <leader>n :nohl<CR>
noremap <leader>w :w<CR>

inoremap { {}<LEFT>
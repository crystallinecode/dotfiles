"active split switch tip
" Use ctrl-[hjkl] to select the active split!
"nmap <silent> <c-k> :wincmd k<CR>
"nmap <silent> <c-j> :wincmd j<CR>
"nmap <silent> <c-h> :wincmd h<CR>
"nmap <silent> <c-l> :wincmd l<CR>

" numbered rows
set number

" make backspace work like most other programs
set backspace=indent,eol,start

" Necessary vundle settings
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'davidhalter/jedi-vim'
Plugin 'jnurmine/Zenburn'
Plugin 'morhetz/gruvbox'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

autocmd FileType python map <buffer> <F1> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F1> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd FileType python map <buffer> <F2> :w<CR>:SyntasticCheck<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:SyntasticCheck<CR>

" NON-Gvim enable 256 color for theme support
" export TERM=xterm-256color
set rtp+=~/.vim/bundle/Zenburn/colors
colorscheme zenburn

"jedi remove docstring during completion
autocmd FileType python setlocal completeopt-=preview

" syntastic recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" define syntastic checker
let g:syntastic_python_checkers = ['pylint']

" make Bd behave as bd without closing split
command Bd bp\|bd \#

" numbered rows
set number

" make backspace work like most other programs
set backspace=indent,eol,start

" TEST incremental search
set incsearch
" TEST highlight search
set hlsearch
" TEST cursorcolumn
set cursorcolumn

" use ctrl + standard navigation keys for split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" code folding
set foldmethod=indent
set foldlevel=99

" code folding with spacebar
nnoremap <space> za

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

autocmd FileType python map <buffer> <F1> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F1> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType python map <buffer> <F2> :w<CR>:SyntasticCheck<CR>
autocmd FileType python imap <buffer> <F2> <esc>:w<CR>:SyntasticCheck<CR>

" NON-Gvim enable 256 color for theme support
" export TERM=xterm-256color
set rtp+=~/.vim/bundle/Zenburn/colors
colorscheme zenburn

"jedi remove docstring during completion
autocmd FileType python setlocal completeopt-=preview
let g:jedi#popup_on_dot = 0

" syntastic recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" make syntastic passive
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": ["python"] }

" define syntastic checker
let g:syntastic_python_checkers = ['pylint']

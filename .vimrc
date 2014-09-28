set t_Co=256
call pathogen#infect()

filetype plugin indent on
set number

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

syntax on
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme molokai

set tabstop=2
set shiftwidth=2
set expandtab

" Make file path tab completion not dumb
set wildmode=longest,list,full
set wildmenu

" Show trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\t/
match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

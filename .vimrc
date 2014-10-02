execute pathogen#infect()

set nocompatible

"Colors
set t_Co=256
set t_ut=
colorscheme hammer
syntax on

set number

"Indenting
set autoindent
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround

"Searching
set ignorecase
set incsearch
set hlsearch

"Folding
set foldcolumn=0
set foldlevel=0           " show contents of all folds
set foldmethod=indent     " use indent unless overridden
set nofen                 " disable folds

"Misc
set backspace=2           " allow backspacing over everything in insert mode
set diffopt=filler,iwhite " keep files synced and ignore whitespace
set history=50            " keep 50 lines of command line history
set laststatus=2          " always have status bar
set linebreak             " This displays long lines as wrapped at word boundries
set showmatch             " Show matching brackets.
set matchtime=10          " Time to flash the brack with showmatch
set nobackup              " Don't keep a backup file
set notimeout             " i like to be pokey
set ttimeout              " timeout on key-codes
set ttimeoutlen=100       " timeout on key-codes after 100ms
set ruler                 " the ruler on the bottom is useful
set scrolloff=1           " dont let the curser get too close to the edge
set showcmd               " Show (partial) command in status line.
set textwidth=0           " Don't wrap words by default
set textwidth=80          " This wraps a line with a break when you reach 80 chars
set virtualedit=block     " let blocks be in virutal edit mode
set wildmenu              " This is used with wildmode(full) to cycle options
set listchars=tab:>-,trail:-                 " prefix tabs with a > and trails with -
set whichwrap+=<,>,[,],h,l,~                 " arrow keys can wrap in normal and insert modes
set wildmode=list:longest,full               " list all options, match to the longest

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files I am not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.class

" Trailing whitespace is annoying
hi ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"Make ctrl-l clear the current search
nnoremap <silent> <C-L> :nohlsearch<CR>

"Change the leader from \ to ,
let mapleader=","
let localmapleader=","

"Use a temp directory in the home dir rather than in tmp where it can get
"cleaned up without our consent
perl <<EOT
  # Get the user name, should probably get the home dir...
  my $home_dir = (getpwuid($<))[7];

  if ( -e $home_dir ) {
    my $temp_location = "$home_dir/.vim-tmp";
    my $tmp_dir = $temp_location . '/vXXX';
    my $swp_dir = $temp_location . '/swps';

    # If the location doesn't exist, create it
    mkdir $temp_location unless ( -e $temp_location );

    mkdir $tmp_dir unless ( -e $tmp_dir );
    mkdir $swp_dir unless ( -e $swp_dir );

    # Set TMPDIR and directory to the new location
    VIM::DoCommand("let \$TMPDIR = '" . $tmp_dir . "'") if ( -w $tmp_dir );
    VIM::DoCommand("set directory=" . $swp_dir) if ( -w $swp_dir );
  }
EOT

"screen.vim settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = 'new -A -s MAIN'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 1
map <Leader>v :ScreenShellVertical<CR>
map <Leader>h :ScreenShell<CR>
map <Leader>s :ScreenShellReopen<CR>
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <F5> :w<CR> :call ScreenShellSend("load '" . @% . "'")<CR>
map <Leader>r :w<CR> :call ScreenShellSend("rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>b :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>

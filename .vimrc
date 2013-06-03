 set nocompatible               " be iMproved

 filetype off                   " required!

 " load vundle
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " load pathogen
 execute pathogen#infect()
 
 " colorscheme zenburn 
 " let g:zenburn_force_dark_Background=1
 
 " colorscheme detailed
 
 " colorscheme solarized
 " set background=dark
 " let g:solarized_termcolors=256


 colorscheme molokai
 let g:molokai_original = 1
 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'crooloose/nerdtree'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 Bundle 'derekwyatt/vim-scala'
 Bundle 'gre/play2vim'
 Bundle 'L9'
 Bundle 'git://git.wincent.com/command-t.git'

 Bundle 'FuzzyFinder'
 Bundle 'mileszs/ack.vim'
 syntax enable                     " Turn on syntax highlighting.
 filetype plugin indent on     	   " required!

 let mapleader = ","

 set showcmd                       " Display incomplete commands.
 set showmode                      " Display the mode you're in.

 set backspace=indent,eol,start    " Intuitive backspacing.

 set hidden                        " Handle multiple buffers better.

 set wildmenu                      " Enhanced command line completion.
 set wildmode=list:longest         " Complete files like a shell.

 set ignorecase                    " Case-insensitive searching.
 set smartcase                     " But case-sensitive if expression contains a capital letter.

 set number                        " Show line numbers.
 set ruler                         " Show cursor position.

 set incsearch                     " Highlight matches as you type.
 set hlsearch                      " Highlight matches.

 set wrap                          " Turn on line wrapping.
 set scrolloff=3                   " Show 3 lines of context around the cursor.

 set title                         " Set the terminal's title

 set visualbell                    " No beeping.

 set nobackup                      " Don't make a backup before overwriting a file.
 set nowritebackup                 " And again.

 set backupdir=$HOME/.vim/backup//,. " Keep backup files  in one location
 set directory=$HOME/.vim/tmp//,.    " Keep swap files in one location
 set undodir^=$HOME/.vim/undo//,.    " Keep un files in one location

 set tabstop=2                     " Global tab width.
 set shiftwidth=2                  " And again, related.
 set expandtab                     " Use spaces instead of tabs

 set foldmethod=syntax
 set foldnestmax=10
 set nofoldenable
 set foldlevel=1

 set autoindent
 set smartindent
 set shiftwidth=2

 set laststatus=2                  " Show the status line all the time

 set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Automatic fold settings for specific files. Uncomment to use.
 autocmd FileType ruby setlocal foldmethod=syntax
 autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
 autocmd FileType scss  setlocal foldmethod=indent shiftwidth=2 tabstop=2

 " set cursorline

 nnoremap <F1> :set nohlsearch!<CR>

 " fuzzyfinder mapping
 map <Leader>t :FuzzyFinderTextMate<Enter>

 " map capital W as saving because your shift timing sucks
 map <Leader>w :w<Enter> 

 " set continious indent helpers
 vmap > >gv
 vmap < <gv

 " enable scss plugin
 au BufRead,BufNewFile *.scss set filetype=scss
 au BufRead,BufNewFile *.thor set filetype=ruby

 " emulate hamlc syntax highlighting
 au BufRead,BufNewFile *.hamlc set ft=haml

 " enable documentation support with rcodetools
 " let g:rct_completion_use_fri = 1
 let g:RCT_ri_cmd = "ri -T --format=bs "


 " Save and reload Foldings automatically
 autocmd BufWinLeave *.* mkview
 autocmd BufWinEnter *.* silent loadview 

 " Set rspec testing to ,] other than ,t
 " (Because it conflicts with fuzzyfinder_textmate)
 autocmd BufNewFile,BufRead *_spec.rb compiler rspec
 map <Leader>] <Plug>MakeGreen " change from <Leader>t to <Leader>]


 " Bind Q and W commands to lower case equals.
 command! Q q
 command! W w

 " Delete trailing whitespace
 fun! <SID>StripTrailingWhitespaces()
     let l = line(".")
     let c = col(".")
     %s/\s\+$//e
     call cursor(l, c)
 endfun

 autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces() 

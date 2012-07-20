call pathogen#runtime_append_all_bundles()  " adding pathogen to vimrc
call pathogen#helptags()


syntax on            
set nocompatible        " choose no compatibility with legacy vi
set encoding=utf-8
set showcmd             " display incomplete commands
filetype plugin indent on " load file type plugins + indentation


"" Whitespace
set nowrap                          " don't wrap lines
set tabstop=4 shiftwidth=4          " a tab is two spaces (or set this to 4)
set expandtab                       " use spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden


set linebreak

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler


set nobackup
" set backup
" set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/temp

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase


"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

"" Mappings
nmap <F8> :TagbarToggle<CR>         " mapping f8 to TagbarToggle
nmap <F2> :NERDTreeToggle<CR>       " mapping f2 to NERDTreeToggle
nmap <F3> :NumbersToggle<CR>        " mapping f3 to NumbersToggle
noremap <F5> :GundoToggle<CR>       " mapping f5 to Gundo
noremap <F9> :Gcommit<CR>           " mapping f9 to Gcommit

map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>

let g:solarized_termtrans = 1  " Solarized transparency
set background=dark
colorscheme solarized          " Theme

" Powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'

"SWAGG
set relativenumber                           " setting line numbers
set colorcolumn=120                           " line to show 81 character mark
set cursorline                               " shows the horizontal cursor line

"Badass Functions
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

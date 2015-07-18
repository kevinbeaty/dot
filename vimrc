set nocompatible
filetype on
filetype off
call pathogen#infect()

syntax on
filetype on
filetype plugin on
filetype plugin indent on
set expandtab
set smarttab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=eol,indent,start
set title
set ruler
set showcmd
set history=1000
set ignorecase
set smartcase
set scrolloff=3
set visualbell
set hidden

set background=dark
colorscheme solarized
let g:solarized_termtrans = 1


map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

let mapleader=","
nmap <leader>a :Ack!

let g:SuperTabDefaultCompletionType = "context"
set completeopt=longest,preview
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*.swp

autocmd BufNewFile,BufRead *.json set ft=javascript

" Sends text to next tmux pane
function! Tmux(text)
    let escaped = substitute(a:text, "'", "'\\\\''", 'g')
    call system("tmux set-buffer '" . escaped . "'")
    call system("tmux paste-buffer -t:.+1")
endfunction

vmap <C-c><C-c> "ty :call Tmux(@t)<CR>
nmap <C-c><C-c> vip<C-c><C-c>
command! -nargs=* Tmux call Tmux(<q-args> . "\n")

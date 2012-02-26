set nocompatible
filetype on
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

syntax on
filetype on
filetype plugin indent on
set expandtab
set smarttab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=eol,indent,start

set background=dark
colorscheme solarized

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>a :Ack!

let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview 
let g:pep8_map='<leader>8'

" Sends text to next tmux pane
function! Tmux(text)
    let escaped = substitute(a:text, "'", "'\\\\''", 'g') 
    call system("tmux set-buffer '" . escaped . "'")
    call system("tmux paste-buffer -t:.+1")
endfunction

vmap <C-c><C-c> "ty :call Tmux(@t)<CR>
nmap <C-c><C-c> vip<C-c><C-c>
command! -nargs=* Tmux call Tmux(<q-args> . "\n")

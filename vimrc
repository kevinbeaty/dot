set nocompatible
filetype on
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

syntax on
filetype on
filetype plugin indent on
set tabstop=8
set expandtab
set softtabstop=4
set smarttab
set shiftwidth=4
set autoindent
color vividchalk


" Use firefox for OpenURL (Rpreview)
"command -bar -nargs=1 OpenURL :!firefox <args>

" Use vimprobable for OpenURL (Rpreview)
command -bar -nargs=1 OpenURL :!vimprobable2 <args>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <leader>a :Ack!

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType="context"
set completeopt=menuone,longest,preview 
let g:pep8_map='<leader>8'

"map <leader>j :RopeGotoDefinition<CR>j
"map <leader>r :RopeRename<CR>

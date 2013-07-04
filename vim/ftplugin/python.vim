set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
setlocal omnifunc=pythoncomplete#Complete

" Pasting into IPython to avoid indentation errors
" Tmux function defined in vimrc
vmap <C-c><C-i> "ty :call Tmux("\n%cpaste\n" . @t . "\n--\n")<CR>
nmap <C-c><C-i> vip<C-c><C-i>

" Flake 8 on write
autocmd BufWritePost *.py call Flake8()

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0

call virtualenv#load()

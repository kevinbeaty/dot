setlocal omnifunc=pythoncomplete#Complete
let g:pep8_map='<leader>8'

" Pasting into IPython to avoid indentation errors
" Tmux function defined in vimrc
vmap <C-c><C-i> "ty :call Tmux("\n%cpaste\n" . @t . "\n--\n")<CR>
nmap <C-c><C-i> vip<C-c><C-i>

" Flake 8 on write
autocmd BufWritePost *.py call Flake8()

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
setlocal omnifunc=pythoncomplete#Complete

let python_highlight_all = 1

" Flake 8 on write
autocmd BufWritePost *.py call Flake8()

setlocal omnifunc=pythoncomplete#Complete
let g:pep8_map='<leader>8'

" Pasting into IPython to avoid indentation errors
" Tmux function defined in vimrc
vmap <C-c><C-i> "ty :call Tmux("\n%cpaste\n" . @t . "\n--\n")<CR>
nmap <C-c><C-i> vip<C-c><C-i>

" Flake 8 on write
autocmd BufWritePost *.py call Flake8()

" Jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
" http://stackoverflow.com/questions/3881534/set-python-virtualenv-in-vim
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif

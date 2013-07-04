" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
" http://stackoverflow.com/questions/3881534/set-python-virtualenv-in-vim
if exists("g:loaded_virtualenv") || !has('python') && !has('python3')
  finish
endif
let g:loaded_virtualenv = 1

function! s:activate(path)
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
function! virtualenv#load()
    " Only attempt to load this virtualenv if the defaultvirtualenv
    " actually exists, and we aren't running with a virtualenv active.
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call s:activate(defaultvirtualenv)
    endif
endfunction

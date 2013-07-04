if exists("g:loaded_htmlcompletelower")
  finish
endif
let g:loaded_htmlcompletelower = 1

" http://objectmix.com/editors/208298-html-omni-completion-returns-tags-uppercase-only.html
function! htmlcompletelower#complete(findstart, base)
    let comp = htmlcomplete#CompleteTags(a:findstart,a:base)

    if !a:findstart && !empty(comp)
        if type(comp[0]) == type({})
            call map(comp,'v:val.word !~ "^!"?tolower(v:val.word):v:val.word')
        else
            call map(comp,'v:val !~ "^!"?tolower(v:val):v:val')
        endif
    endif
    return comp
endfunction

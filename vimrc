set nocompatible
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

syntax on
filetype plugin indent on
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
color vividchalk

" Use firefox for OpenURL (Rpreview)
"command -bar -nargs=1 OpenURL :!firefox <args>

" Use vimprobable for OpenURL (Rpreview)
 command -bar -nargs=1 OpenURL :!vimprobable2 <args>

setlocal omnifunc=htmlcompletelower#complete
call SuperTabChain(&omnifunc, "<c-p>")
call SuperTabSetDefaultCompletionType("<c-x><c-u>")

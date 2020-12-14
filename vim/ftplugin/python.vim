" python

setl wrap!
setl nowrap
setl tw=0

autocmd BufWritePre *.py execute 'silent Black'
let g:python_highlight_all = 1

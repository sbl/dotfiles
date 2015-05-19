let g:scala_sort_across_groups=1
au BufEnter *.scala setl formatprg=java\ -jar\ $HOME/Dropbox/bin/scalariform.jar\ -f\ -q\ --preferenceFile=$HOME/.scalariform\ --stdin\ --stdout
"nmap <leader>m :SortScalaImports<CR>gggqG<C-o><C-o><leader><w>
nmap <leader>m gggqG<C-o><C-o><leader><w>

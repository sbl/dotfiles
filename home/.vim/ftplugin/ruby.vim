compiler ruby | setl makeprg=ruby\ -w\ \"%:p\" |

nnoremap <F6> :!ruby %:p<CR>
nnoremap <F12> :!bundle exec rake test TEST=%:p<CR>

" Prevent cursor from moving when leaving insert mode.
inoremap <silent> <Esc> <Esc>`^

" Mappings.
nnoremap <leader>gg :GitGutterToggle<cr>
nnoremap <leader>gi :IndentGuidesToggle<cr>
nnoremap <leader>m :set mouse=a<cr>
nnoremap <leader>q :call vice#standard_issue#smart_quit()<cr>
nnoremap Q :call vice#standard_issue#smart_quit()<cr>
nnoremap J <c-d>
nnoremap K <c-u>
vnoremap J <c-d>
vnoremap K <c-u>
inoremap <c-u> <c-o>dd
nnoremap ; :

au filetype go nnoremap <buffer> <silent> K <c-u>

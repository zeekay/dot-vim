set nocompatible
filetype indent plugin on | syntax on

let options = {
    \ 'addons': [
        \ 'github:zeekay/vice-beautify',
        \ 'github:zeekay/vice-colorful',
        \ 'github:zeekay/vice-ctrlp',
        \ 'github:zeekay/vice-delimitmate',
        \ 'github:zeekay/vice-git',
        \ 'github:zeekay/vice-polyglot',
        \ 'github:zeekay/vice-neocompletion',
        \ 'github:zeekay/vice-powerline',
        \ 'github:zeekay/vice-standard-issue',
        \ 'github:zeekay/vice-syntastic',
        \ 'github:zeekay/vice-tagbar',
        \ 'github:zeekay/vice-undo',
        \ 'github:zeekay/vim-cake',
        \ 'github:nathanaelkane/vim-indent-guides',
        \ 'github:terryma/vim-multiple-cursors',
        \ 'github:airblade/vim-gitgutter',
        \ 'github:godlygeek/tabular',
        \ 'github:tpope/vim-vinegar',
        \ 'github:zeekay/vice-nerdtree',
    \ ],
    \ 'commands': {
        \ 'Sum': ['github:zeekay/visSum.vim'],
    \ },
    \ 'standard_issue': {
        \ 'transparency': 0
    \ }
\ }

if has('mac') && version > 702
    let options.addons += ['github:Shougo/vimproc', 'github:Shougo/vimshell']
    let options.neocompletion = {'enable_tern': 1}
endif

let &rtp.=','.expand('~/.vim/addons/vice')
call vice#Initialize(options)

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

if has('gui_running')
    color base16-mocha
    set background=dark
    " color minimal
    " hi Normal guifg=#fcffe0 guibg=#3b3933
else
    set lazyredraw
    " set nolazyredraw
    " set ttyfast

    " color Tomorrow-Night-Eighties
    color hybrid
    hi Normal ctermbg=235 ctermfg=254

    let g:indent_guides_auto_colors = 0
    hi IndentGuidesOdd  ctermbg=236
    hi IndentGuidesEven ctermbg=236
endif

hi link coffeeFunction Function
hi link coffeeMethod Function
hi link coffeeObjAssign Statement

" abbreviations
cabbrev ack <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Ack' : 'ack')<CR>
cabbrev shell <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'VimShell' : 'shell')<CR>
cabbrev shelli <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'VimShellInteractive' : 'shell')<CR>

" mappings
nnoremap ; :
vnoremap ; :

" prevent cursor from moving when leaving insert mode
inoremap <Esc> <Esc>`^

nnoremap <leader>q :q<cr>
nnoremap Q ZQ
nnoremap J <c-d>
nnoremap K <c-u>
vnoremap J <c-d>
vnoremap K <c-u>
inoremap <c-u> <c-o>dd

cabbrev su SudoWrite
cabbrev sudo SudoWrite

" repeat across visual selection
xnoremap . :norm.<cr>

" macro across visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <F1> :set number!<cr>
inoremap <F1> :set number!<cr>

nnoremap <F2> :ColorNext<cr>
inoremap <F2> :ColorNext<cr>

nnoremap <F3> :ColorPrev<cr>
inoremap <F3> :ColorPrev<cr>

let g:python_highlight_all = 1
let g:gitgutter_enabled = 0

nnoremap <leader>gg :GitGutterToggle<cr>

" call vice#ForceActivateAddons([
"     \ 'github:Shougo/unite.vim',
"     \ 'github:Shougo/vimfiler.vim',
" \ ])
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_execute_file_list = {'_': 'vim'}
" let g:vimfiler_force_overwrite_statusline = 0
" let g:loaded_netrwPlugin = 1

" func! s:escaped(first, last) abort
"   let files = getline(a:first, a:last)
"   call filter(files, 'v:val !~# "^\" "')
"   call map(files, 'substitute(v:val, "[/*|@=]\\=\\%(\\t.*\\)\\=$", "", "")')
"   return join(map(files, 'fnamemodify(b:vimfiler.current_dir."/".v:val,":~:.")'), ' ')
" endf

" au FileType vimfiler nnoremap <buffer> u :silent VimFiler ..<cr>:pwd<cr>
" au FileType vimfiler nnoremap <buffer> J <c-d>
" au FileType vimfiler nnoremap <buffer> K <c-u>
" au FileType vimfiler nnoremap <buffer> o <Plug>(vimfiler_expand_tree)
" au FileType vimfiler nnoremap <buffer> O <Plug>(vimfiler_expand_tree_recursive)
" au FileType vimfiler noremap <buffer> . :<C-U> <C-R>=<SID>escaped(line('.'), line('.') - 1 + v:count1)<CR><Home>
" au FileType vimfiler xnoremap <buffer> . <Esc>: <C-R>=<SID>escaped(line("'<"), line("'>"))<CR><Home>
" au FileType vimfiler nmap <buffer> ! .!
" au FileType vimfiler xmap <buffer> ! .!

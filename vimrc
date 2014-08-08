if filereadable(expand('~/.vim/local/vimrc')) | so ~/.vim/local/vimrc | finish | endif

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
        \ 'github:zeekay/vice-standard-issue',
        \ 'github:zeekay/vice-syntastic',
        \ 'github:zeekay/vice-tagbar',
        \ 'github:zeekay/vice-undo',
        \ 'github:zeekay/vice-nerdtree',
        \ 'github:zeekay/vice-startify',
        \ 'github:zeekay/vice-lightline',
        \ 'github:terryma/vim-multiple-cursors',
        \ 'github:tpope/vim-vinegar',
    \ ],
    \ 'commands': {
        \ 'GitGutterToggle':    ['github:airblade/vim-gitgutter'],
        \ 'IndentGuidesToggle': ['github:nathanaelkane/vim-indent-guides'],
        \ 'Sum':                ['github:zeekay/visSum.vim'],
        \ 'Tabularize':         ['github:godlygeek/tabular'],
    \ }
\ }

if has('mac') && version > 702
    let options.addons += ['github:Shougo/vimproc', 'github:Shougo/vimshell']
    let options.neocompletion = {
        \ 'enable_clang_complete': 1,
        \ 'enable_jedi':           1,
        \ 'enable_necoghc':        1,
        \ 'enable_tern':           1,
    \ }
    let options.polyglot = {'enable_ghcmod': 1}
endif

" Override options passed to vice
if filereadable(expand('~/.vim/local/options.vim'))
    so ~/.vim/local/options.vim
endif

let &rtp.=','.expand('~/.vim/addons/vice')
call vice#Initialize(options)

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

" Abbreviations.
cabbrev shell  <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'VimShell' : 'shell')<CR>
cabbrev shelli <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'VimShellInteractive' : 'shelli')<CR>

" Look and feel.
set background=dark

if has('gui_running')
    color nefertiti
else
    if $VIM_LIGHT_BG
        set background=light
        color solarized
        hi Normal ctermbg=15
        let g:lightline['colorscheme'] = 'solarized'
    else
        color hybrid
        hi Normal           ctermbg=235 ctermfg=254
        hi IndentGuidesOdd  ctermbg=236
        hi IndentGuidesEven ctermbg=236
        let g:indent_guides_auto_colors = 0
    endif
    set nolazyredraw
    set ttyfast
endif

let g:gitgutter_enabled         = 0
let g:indent_guides_guide_size  = 1
let g:indent_guides_start_level = 2

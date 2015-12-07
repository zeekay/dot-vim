set nocompatible
filetype indent plugin on | syntax on

let options = {
    \ 'addons': [
        \ 'github:zeekay/vice-colorful',
        \ 'github:zeekay/vice-ctrlp',
        \ 'github:zeekay/vice-delimitmate',
        \ 'github:zeekay/vice-git',
        \ 'github:zeekay/vice-markdown',
        \ 'github:zeekay/vice-polyglot',
        \ 'github:zeekay/vice-neocompletion',
        \ 'github:zeekay/vice-standard-issue',
        \ 'github:zeekay/vice-syntastic',
        \ 'github:zeekay/vice-tagbar',
        \ 'github:zeekay/vice-undo',
        \ 'github:zeekay/vice-nerdtree',
        \ 'github:zeekay/vice-startify',
        \ 'github:zeekay/vice-lightline',
        \ 'github:tpope/vim-vinegar',
    \ ],
    \ 'commands': {
        \ 'Beautify':           ['github:zeekay/vim-beautify'],
        \ 'EasyAlign':          ['github:junegunn/vim-easy-align'],
        \ 'FlappyVird':         ['github:mattn/flappyvird-vim'],
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
        \ 'enable_racer':          1,
    \ }
    let options.polyglot = {'enable_ghcmod': 1}
endif

if filereadable(expand('~/.vim/before.vim')) | so ~/.vim/before.vim | endif

let &rtp.=','.expand('~/.vim/addons/vice')
call vice#Initialize(options)

if filereadable(expand('~/.vim/after.vim')) | so ~/.vim/after.vim | endif

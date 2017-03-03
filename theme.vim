" Look and feel.
set background=dark

if !exists('g:lightline')
    let g:lightline = {}
endif

if has('gui_running')
    color Tomorrow-Night
    " Fix $PATH when opened from elsewhere.
    if $PATH == '/usr/bin:/bin:/usr/sbin:/sbin'
        let $PATH=system("zsh -ic 'echo $PATH'")
    endif
else
    if $VIM_LIGHT_BG || $ITERM_PROFILE =~ 'light'
        set background=light
        color solarized
        hi Normal ctermbg=15
        let g:lightline['colorscheme'] = 'solarized'
        hi Search ctermfg=254 ctermbg=244
        hi IncSearch ctermfg=250 ctermbg=238
    else
        color hybrid
        hi Comment ctermfg=darkgray
        hi Constant ctermfg=183
        hi Function cterm=bold ctermfg=white
        hi Identifier cterm=none
        hi Normal  ctermbg=none ctermfg=251
        hi Statement ctermfg=36
        hi String ctermfg=248
        hi Structure ctermfg=36 cterm=bold
        hi Type ctermfg=305

        hi coffeeObjAssign ctermfg=lightgreen cterm=bold

        hi diffAdded ctermfg=36
        hi diffRemoved ctermfg=darkgray

        hi LightlineLeft_normal_0 ctermbg=36

        let g:lightline['colorscheme'] = 'Tomorrow_Night_Eighties'

        " hi IndentGuidesOdd  ctermbg=236
        " hi IndentGuidesEven ctermbg=236
        " let g:indent_guides_auto_colors = 0
    endif
endif

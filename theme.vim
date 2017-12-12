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
        color muon
        " hi Comment ctermfg=darkgray
        " hi Constant ctermfg=183
        " hi Function cterm=bold ctermfg=white
        " hi Identifier cterm=none
        " hi Normal  ctermbg=none ctermfg=251
        hi Statement ctermfg=36
        hi Title ctermfg=36
        hi String ctermfg=248

        " Remove hardcoded ctermbg so we can have a transparent bg
        hi NonText ctermbg=none
        hi Comment ctermbg=none
        hi Constant ctermbg=none
        hi Delimiter ctermbg=none
        hi Exception ctermbg=none
        hi Function ctermbg=none
        hi Identifier ctermbg=none
        hi Normal ctermbg=none
        hi Number ctermbg=none
        hi Preproc ctermbg=none
        hi Special ctermbg=none
        hi Statement ctermbg=none
        hi String ctermbg=none
        hi Structure ctermbg=none
        hi Type ctermbg=none

        hi DiffText cterm=none ctermbg=none
        hi DiffChange ctermbg=none
        hi DiffAdd ctermbg=none
        hi DiffDelete ctermbg=234 ctermfg=235
        hi IncSearch ctermfg=250 ctermbg=238 cterm=none
        hi StartifyFooter ctermfg=240 ctermbg=none

        " hi Structure ctermfg=36 cterm=bold
        " hi Type ctermfg=305

        " hi coffeeObjAssign ctermfg=lightgreen cterm=bold

        " hi diffAdded ctermfg=36
        " hi diffRemoved ctermfg=darkgray

        " hi LightlineLeft_normal_0 ctermbg=36

        let g:lightline['colorscheme'] = 'Tomorrow_Night_Eighties'

        " hi IndentGuidesOdd  ctermbg=236
        " hi IndentGuidesEven ctermbg=236
        " let g:indent_guides_auto_colors = 0
    endif
endif

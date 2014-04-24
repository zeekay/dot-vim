#!/usr/bin/env bash

VIM_ADDONS=$HOME/.vim/addons

pkg.install() {
    files=(gvimrc vimrc vimgitrc vimpagerrc)

    for file in ${files[@]}; do
        ellipsis.link_file $PKG_PATH/$file
    done

    # link module into ~/.vim
    ellipsis.backup $HOME/.vim
    ln -s $PKG_PATH $HOME/.vim
    # ellipsis.link_file $PKG_PATH

    # install dependencies
    cd $VIM_ADDONS
    git.clone https://github.com/zeekay/vice
    git.clone https://github.com/MarcWeber/vim-addon-manager
}

pkg.pull() {
    # update installed addons
    for addon in "$VIM_ADDONS/"*; do
        if [ -e "$addon" ]; then
            git.pull "$addon"
        fi
    done
}

pkg.push() {
    # update installed addons
    for addon in "$VIM_ADDONS/"*; do
        if [ -e "$addon" ]; then
            git.push "$addon"
        fi
    done
}

pkg.status() {
    # status of addons
    for addon in "$VIM_ADDONS/"*; do
        if [ -e "$addon" ]; then
            git.status "$addon"
        fi
    done
}

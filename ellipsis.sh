#!/usr/bin/env bash

VIM_ADDONS=$HOME/.vim/addons

mod.install() {
    files=(gvimrc vimrc vimgitrc vimpagerrc)

    for file in ${files[@]}; do
        ellipsis.link_file $mod_path/$file
    done

    # link module into ~/.vim
    ellipsis.backup $HOME/.vim
    ln -s $mod_path $HOME/.vim
    # ellipsis.link_file $mod_path

    # install dependencies
    cd $VIM_ADDONS
    git.clone https://github.com/zeekay/vice
    git.clone https://github.com/MarcWeber/vim-addon-manager
}

mod.pull() {
    # update installed addons
    for addon in "$VIM_ADDONS/"*; do
        if [ -e "$addon" ]; then
            git.pull "$addon"
        fi
    done
}

mod.push() {
    # update installed addons
    for addon in "$VIM_ADDONS/"*; do
        if [ -e "$addon" ]; then
            git.push "$addon"
        fi
    done
}

mod.status() {
    # status of addons
    for addon in "$VIM_ADDONS/"*; do
        if [ -e "$addon" ]; then
            git.status "$addon"
        fi
    done
}

#!/usr/bin/env bash

GIT_ROOT=https://github.com
VIM_ADDONS=$HOME/.vim/addons

mod.install() {
    files=(vimrc vimgitrc vimpagerrc)

    # backup existing vim file/folders
    ellipsis.backup $HOME/.vim

    # link files into place
    ln -s $mod_path $HOME/.vim

    for file in ${files[*]}; do
        ellipsis.link_file $HOME/.$file
    done

    # install dependencies
    git.clone $GIT_ROOT/zeekay/vice $VIM_ADDONS/vice
    git.clone $GIT_ROOT/MarcWeber/vim-addon-manager $VIM_ADDONS/vim-addon-manager
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

#!/usr/bin/env bash

GIT_ROOT=https://github.com
VIM_VIM_ADDONS=~/.vim/addons

mod.install() {
    files=(vimrc vimgitrc vimpagerrc)
    folders=(vim/addons vim/tmp/backup vim/tmp/undo)

    # backup existing vim file/folders
    ellipsis.backup ~/.vim

    for file in $files; do
        ellipsis.backup ~/.$file
    done

    # create folder structure
    for folder in $folders; do
        mkdir -p ~/.$folder
    done

    # install dependencies
    git.clone $GIT_ROOT/zeekay/vice $VIM_ADDONS/vice
    git.clone $GIT_ROOT/MarcWeber/vim-addon-manager $VIM_ADDONS/vim-addon-manager

    # link files in place
    for file in $files; do
        ln -s "$mod_path/$file" ~/.$file
    done
}

mod.pull() {
    # update deps
    git.pull $VIM_ADDONS/vice
    git.pull $VIM_ADDONS/vim-addon-manager

    # update installed addons
    for addon in $VIM_ADDONS/*; do
        if [ -e "$addon" ]; then
            git.pull "$addon"
        fi
    done
}

mod.push() {
    # update deps
    git.push $VIM_ADDONS/vice
    git.push $VIM_ADDONS/vim-addon-manager

    # update installed addons
    for addon in $VIM_ADDONS/*; do
        if [ -e "$addon" ]; then
            git.push "$addon"
        fi
    done
}

mod.status() {
    # status of deps
    git.status $VIM_ADDONS/vice
    git.status $VIM_ADDONS/vim-addon-manager

    # status of addons
    for addon in $VIM_ADDONS/*; do
        if [ -e "$addon" ]; then
            git.status "$addon"
        fi
    done
}

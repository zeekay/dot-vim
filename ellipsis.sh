#!/usr/bin/env bash
#
# zeekay/vim
#
# My vice-based vim configuration.

pkg.install() {
    files=(gvimrc vimrc vimgitrc vimpagerrc)

    for file in ${files[@]}; do
        fs.link_file $file
    done

    # link module into ~/.vim
    fs.link_file $PKG_PATH

    # install dependencies
    cd ~/.vim/addons
    git.clone https://github.com/zeekay/vice
    git.clone https://github.com/MarcWeber/vim-addon-manager
}

helper() {
    # run command for ourselves
    $1

    # run command for each addon
    for addon in ~/.vim/addons/*; do
        if [ -e $addon ]; then
            cd $addon
            $1 $addon
        fi
    done
}

pkg.pull() {
    helper git.pull
}

pkg.push() {
    helper git.push
}

pkg.status() {
    helper hooks.status
}

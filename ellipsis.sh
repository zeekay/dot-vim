#!/usr/bin/env bash
#
# zeekay/dot-vim
# My vice-based vim configuration.

pkg.install() {
    files=(gvimrc vimrc vimgitrc vimpagerrc)

    for file in ${files[@]}; do
        ellipsis.link_file $PKG_PATH/$file
    done

    # link module into ~/.vim
    ellipsis.backup ~/.vim
    ln -s $PKG_PATH ~/.vim

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
        if [ -e "$addon" ]; then
            cd $addon
            $1 "$addon"
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
    helper git.status
}

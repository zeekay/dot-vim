#!/usr/bin/env bash
#
# zeekay/vim
#
# My vice-based vim configuration.

pkg.link() {
    files=(gvimrc vimrc vimgitrc vimpagerrc xvimrc)

    for file in ${files[@]}; do
        fs.link_file $file
    done

    # link module into ~/.vim
    fs.link_file $PKG_PATH
}

pkg.install() {
    # install dependencies
    cd ~/.vim/addons
    git.clone https://github.com/zeekay/vice
    git.clone https://github.com/MarcWeber/vim-addon-manager

    # use vim as git mergetool
    git.add_include '~/.vim/gitinclude'
}

helper() {
    # run command for ourselves
    $1

    # run command for each addon
    for addon in ~/.vim/addons/*; do
        # git status/push only repos which are ours
        if [ $1 = "git.pull" ] || [ "$(cat $addon/.git/config | grep url | grep $ELLIPSIS_USER)" ]; then
            cd $addon
            $1 vim/$(basename $addon)
        fi
    done
}

pkg.pull() {
    helper git.pull
}

pkg.status() {
    helper hooks.status
}

pkg.push() {
    helper git.push
}

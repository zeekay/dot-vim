#!/usr/bin/env bash
#
# zeekay/vim
#
# My vice-based vim configuration.

# Forward ellipsis commands to vim addons
helper() {
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

# Update various deps
#
# Uses $PKG_PATH/addons (the real checkout) rather than ~/.vim/addons: during
# pkg.install the ~/.vim symlink doesn't exist yet (pkg.link runs afterwards),
# and post-link ~/.vim/addons resolves to the same path anyway.
update_deps() {
    if utils.cmd_exists make; then
        cd $PKG_PATH/addons/vimproc && make
    fi
    if utils.cmd_exists npm; then
        cd $PKG_PATH/addons/tern_for_vim && npm install
    fi
}

pkg.link() {
    files=(inputrc gvimrc vimrc vimgitrc vimpagerrc xvimrc)

    for file in ${files[@]}; do
        fs.link_file $file
    done

    # link module into ~/.vim
    fs.link_file $PKG_PATH
    mkdir -p ~/.config/nvim
    fs.link_file $PKG_PATH/nvimrc ~/.config/nvim/init.vim
}

pkg.install() {
    # install dependencies
    mkdir -p $PKG_PATH/addons && cd $PKG_PATH/addons
    git.clone https://github.com/zeekay/vice
    git.clone https://github.com/MarcWeber/vim-addon-manager
    git.clone https://github.com/ternjs/tern_for_vim
    git.clone https://github.com/Shougo/vimproc

    update_deps

    # use vim as git mergetool
    git.add_include '~/.vim/gitinclude'
}

pkg.pull() {
    helper git.pull
    update_deps
}

pkg.status() {
    helper hooks.status
}

pkg.push() {
    helper git.push
}

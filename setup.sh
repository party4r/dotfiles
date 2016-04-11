#!/bin/bash 
setup() {
    mkdir -p ~/local/bin
    mkdir -p ~/local/src 
}

make_vim73() {
    cd ~/local/src/
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
    tar jxf vim-7.3.tar.bz2
    cd vim73
    ./configure --enable-multibyte --with-features=huge --disable-gui --without-x --prefix=~/local --enable-rubyinterp --enable-pythoninterp --enable-perlinterp
    make && make install
    cd ~/
}

make_ack() {
    cd ~/local/bin
    wget http://betterthangrep.com/ack-standalone
    mv ack-standalone ack
    chmod 744 ack
    cd ~/
}

make_ctags() {
    cd ~/local/src/
    wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar zxvf ctags-5.8.tar.gz
    cd ctags-5.8
    ./configure --prefix=$HOME/local
    make && make install
    cd ~/
}

make_vim_neobundle() {
    cd ~
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
}

clean_dotfiles() {
    cd ~
    local arrayname=$1
    eval ref=\"\${$arrayname[@]}\"
    local list=( ${ref} )
    i=0
    for e in ${list[@]}; do
        rm -rf ${e}
        let i++
    done
}

make_sym() {
    cd ~
    local arrayname=$1
    eval ref=\"\${$arrayname[@]}\"
    local list=( ${ref} )
    i=0
    for e in ${list[@]}; do
        ln -s ~/dotfiles/${e} "${e}"
        let i++
    done
}

make_php-cs-fixer() {
    wget http://get.sensiolabs.org/php-cs-fixer.phar -O local/bin/php-cs-fixer
    chmod a+x local/bin/php-cs-fixer
}

dotList=(".login" ".bash_profile" ".zshenv" ".zshrc" ".tcshrc" ".bashrc" ".vimrc" ".vim" ".ackrc" ".gitconfig")
setup
clean_dotfiles dotList
make_sym dotList
make_vim_neobundle
make_ack

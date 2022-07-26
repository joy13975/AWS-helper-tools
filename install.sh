#!/usr/bin/env sh


if [ -z "$(aws --version | grep aws-cli/2)" ]; then
    echo 'You need AWS-CLI v2.\nInstall from https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html'
    exit 1
fi

PREFIX=${PREFIX:-$HOME}
git clone --depth=1 https://github.com/joy13975/AWS-helper-tools.git $PREFIX/.aws-helper-tools

# auto detect AHT_RCFILE
AHT_RCFILE=~/.zshrc
if [ -z $ZSH_NAME ]; then
    # assume bash
    AHT_RCFILE=~/.bashrc
fi

# Only append to AHT_RCFILE if not already there
new_path=$PREFIX/.aws-helper-tools/bin
if [ -z "$(cat $AHT_RCFILE | grep $new_path)" ]; then
    echo "export PATH=$new_path:"'$PATH' >> $AHT_RCFILE
fi

unset PREFIX
unset AHT_RCFILE
$SHELL
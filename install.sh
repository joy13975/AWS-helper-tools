#!/usr/bin/env sh


is_aws2=$(aws --version | grep aws-cli/2)
if [ "$?" -ne 0 ]; then
    echo 'You need AWS-CLI v2.\nInstall from https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html'
    exit 1
fi

repo_path=${repo_path:-~/.aws-helper-tools}
git clone https://github.com/joy13975/AWS-helper-tools.git $repo_path


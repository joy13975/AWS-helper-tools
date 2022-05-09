#!/usr/bin/env sh

git clone --depth 1 https://github.com/joy13975/aws_mfa_me.git ~/.aws_mfa_me
cat "export PATH=$HOME/.aws_mfa_me:$PATH" >> ~/.bashrc
source ~/.bashrc
#!/usr/bin/env sh

dest=/usr/local/bin/aws_mfa_me
curl -s https://raw.githubusercontent.com/joy13975/aws_mfa_me/master/aws_mfa_me > \
    $dest
chmod +x $dest

#!/usr/bin/env sh


repo_path=${repo_path:-~/.aws-helper-tools}

git clone git@github.com:joy13975/AWS-helper-tools.git $repo_path

# I think adding to $PATH is cleaner, but then it messes with rc files..
ln -fs $repo_path/bin/* /usr/local/bin/
# aws_mfa_me

A simple utility script that activates AWS session credentials with MFA.

Prerequisites:
1. `jq`, a utility command for parsing JSON (get it [here](https://stedolan.github.io/jq/download/)).
1. `aws-cli`, AWS command line tools (get it [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html))

Usage:
```shell
source aws_mfa_me
```

You will be prompted for MFA code.

For convenience, you can copy `aws_mfa_me` to a directory on your `$PATH` such as `/usr/local/bin` for MacOS.

Optional: set duration in seconds as first argument to the script.

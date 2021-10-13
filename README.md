# aws_mfa_me

A simple utility script that activates AWS session credentials with MFA.

Usage:
```shell
source aws_mfa_me
```
[!] This requires the `jq` utility command (get it [here](https://stedolan.github.io/jq/download/)).

For convenience, you can copy `aws_mfa_me` to a directory on your `$PATH` such as `/usr/local/bin` for MacOS.

Optional: set duration in seconds as first argument to the script.
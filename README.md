# AWS Helper Tools
A set of bash scripts to help with daily AWS work.

Script list
* [aws-mfa-me](#aws-mfa-me)
* [get-ec2id-by-name](#get-ec2id-by-name)
* [start-ec2-by-name](#start-ec2-by-name)
* [get-my-ip](#get-my-ip)
* [get-remote-ip](#get-remote-ip)

---

## Install

1. You need `jq`, a utility command for parsing JSON (get it [here](https://stedolan.github.io/jq/download/)).

For MacOS:
```bash
brew install jq
```

1. You need  `aws-cli`, AWS command line tools (get it [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html))

1. Lastly, install the scripts of this repo. For bash:
```shell
bash <(curl -s https://raw.githubusercontent.com/joy13975/AWS-helper-tools/master/install.sh)
```

---

## `aws-mfa-me`

Activates an AWS session in the current shell with MFA.


### Usage
```shell
source aws-mfa-me
```

Optional environment variables:
* `duration`: Session duration; 129600 (36h) by default.
* `mfa_arn`: Specific MFA device ARN; the first MFA device is used by default.

You will be prompted for MFA code. 

To pass a MFA code non-interactively, you can:
```shell
echo 123456 | source aws-mfa-me
```

To make the command shorter you can:
* Replace `source` with `.` as in `. aws-mfa-me`.
* Create a `bash` alias/function such as `alias give-me-aws='source aws-mfa-me'` in your `~/.bashrc` etc.

---
## `get-ec2id-by-name`

Self explanatory.

### Usage
`get-ec2id-by-name <EC2 instance name>`

Note: only exact matches work for now.

---
## `start-ec2-by-name`


Self explanatory.

### Usage
`start-ec2-by-name <EC2 instance name>`

---
## `get-my-ip`

Fetches WAN IP of current machine.

### Usage
`get-my-ip`

Optional environment variables:
* `protocol`: IP protocol; `ipv4` by default.
---

## `get-remote-ip`

Fetches WAN IP of a remote host.

### Usage
`get-remote-ip <remote domain>`

---

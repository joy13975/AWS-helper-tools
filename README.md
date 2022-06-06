# AWS Helper Tools
A set of bash scripts to help with daily AWS work.

Script list
* [aws-mfa-me](#aws-mfa-me)
* [ec2](#ec2)
* [get-ec2id-by-name](#get-ec2id-by-name)
* [get-my-ip](#get-my-ip)
* [get-remote-ip](#get-remote-ip)

---

## Install

1. You need `jq`, a utility command for parsing JSON (get it [here](https://stedolan.github.io/jq/download/)).

For MacOS:
```bash
brew install jq
```
For yum systems:
```bash
sudo yum install -y jq
```

1. You need  `aws-cli`, AWS command line tools (get it [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html))

1. Lastly, install the scripts of this repo. For bash:
```shell
bash <(curl -s https://raw.githubusercontent.com/joy13975/AWS-helper-tools/master/install.sh)
```

### Add script folder to PATH
* Bash
```bash
echo "export PATH=$HOME/.aws-helper-tools/bin:"'$PATH' >> ~/.bashrc
```

* Zsh
```bash
echo "export PATH=$HOME/.aws-helper-tools/bin:"'$PATH' >> ~/.zshrc
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
## `ec2`

### Usage
`ec2 [name] [command] [command_args]`

### Examples
*   ```bash
    ec2 ml-cpu-instance  # no command = describe instance
    ```
*   ```bash
    ec2 ml-cpu-instance start  # starts the instance
    ```
*   ```bash
    ec2 ml-cpu-instance stop  # stops the instance
    ```
*   ```bash
    ec2 ml-cpu-instance status  # gets instance status
    ```
*   ```bash
    ec2 ml-cpu-instance ip  # gets instance private/public IP
    ```
*   ```bash
    ec2 ml-cpu-instance extract PlatformDetails  # extracts arbitrary instance attribute (find keys from describe command)
    ```
*   ```bash
    ec2 ml-cpu-instance reboot  # any [command] is substituted as "aws ec2 [command]-instances ..."
    ```

---
## `get-ec2id-by-name`

Self explanatory.

### Usage
`get-ec2id-by-name [EC2 instance name]`

Note: only exact matches work for now.

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
`get-remote-ip [remote domain]`

---

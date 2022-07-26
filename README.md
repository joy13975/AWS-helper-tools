# AWS Helper Tools
A set of bash scripts to help with daily AWS work.

Tool list
* [aws-mfa-me](#aws-mfa-me) - minimal AWS credential session initialization for MFA accounts.
* [ec2](#ec2) - simple search & control of EC2 instances.
* [get-ec2id-by-name](#get-ec2id-by-name) - self explanatory.
* [get-my-ip](#get-my-ip) - get WAN IP of current computer.
* [get-remote-ip](#get-remote-ip) - get WAN IP of remote computer by domain.

---

## Installation

Use the auto installer script:
```shell
source <(curl -s https://raw.githubusercontent.com/joy13975/AWS-helper-tools/master/install.sh)
```

※ This automatically inserts to $PATH in your RC file (`~/.zsh` or `~/.bashrc`)

---

## `aws-mfa-me`

Activates an AWS session in the current shell with MFA.


### Usage
```shell
source aws-mfa-me
```

Optional environment variables:
* `duration`: Session duration; 129600 (36h) by default.
* `mfa_arn`: Specific MFA device ARN; the first MFA device is used by default. Usage example: `mfa_arn=<specific device arn> source aws-mfa-me`

You will be prompted for MFA code. 

To pass a MFA code non-interactively, you can:
```shell
echo 123456 | source aws-mfa-me
```

Tips:
* You can replace `source` with `.` as in `. aws-mfa-me`.
* Create a `bash` alias/function such as `alias use-aws='source aws-mfa-me'` in your `~/.bashrc` to make the command super short.

---
## `ec2`

A `aws ec2` helper that works with instance names (tag value) rather than instance-ids.

### Usage
`ec2 [name] [command] [command_args]`

### Examples
*   ```bash
    ec2 ml-cpu  # no command = describe instances containing name "ml-cpu"
    ```
*   ```bash
    ec2 ml list  # list instances containing name "ml"
    ```
*   ```bash
    ec2 ml-cpu start  # starts instances containing name "ml-cpu"
    ```
*   ```bash
    ec2 ml-cpu stop  # stops the instance
    ```
*   ```bash
    ec2 ml-cpu status  # gets instance status
    ```
*   ```bash
    ec2 ml-cpu ip  # gets instance private/public IP
    ```
*   ```bash
    ec2 ml-cpu extract PlatformDetails  # extracts arbitrary instance attribute (find keys from describe command)
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

# AWS Helper Tools
A set of bash scripts to help with daily AWS work.

Tool list
* [aws-mfa-me](#aws-mfa-me) - automated AWS credential session caching & refreshing for MFA accounts.
* [ec2](#ec2) - simple search & control of EC2 instances by name.
* [get-ec2id-by-name](#get-ec2id-by-name) - self explanatory.
* [get-my-ip](#get-my-ip) - get WAN IP of current computer.
* [get-remote-ip](#get-remote-ip) - get WAN IP of remote computer by domain.

---

## Installation

Use the auto installer script:
```shell
source <(curl -sk https://raw.githubusercontent.com/joy13975/AWS-helper-tools/master/install.sh)
```
※ This automatically inserts to $PATH in your RC file (`~/.zsh` or `~/.bashrc`)


---

## `aws-mfa-me`

Activates an AWS session in the current shell with MFA.
Uses previously obtained & cached credentials if available.

### Configuration

You must enter the following AWS configurations for this command to work.
1. `~/.aws/credentials`

Add the following to the end of the file
```ini
[my_iam_name]
aws_access_key_id = my_access_key
aws_secret_access_key = my_sec_key
mfa_serial = arn:aws:iam::my_account_id:mfa/my_iam_username
region = my_usual_region
```

* `my_iam_name`: the name for your IAM access key pair - it's up to you to decide. Just don't create duplicate names.
* `my_access_key`, `my_sec_key`, `mfa_serial`: obtained from the AWS Console.
    * Note: `mfa_serial` in this file is non-standard, but if you don't know what that means then it doesn't matter to you.
* `my_usual_region`: e.g. `ap-northeast-1` for Tokyo.

1. `~/.aws/config`

Add the following to the end of the file
```ini
[profile my_dev_role]
role_arn = arn:aws:iam::my_account_id:role/my_dev_role
mfa_serial = arn:aws:iam::my_account_id:mfa/my_mfa_device_name
source_profile = my_iam_name
role_session_name = my_session_name
region = my_usual_region
```
* `my_dev_role`: like `my_iam_name` but for your **role** profile.
* `my_mfa_device_name`: obtained from AWS Console.
* `my_iam_name`: the same value as in the previous sections.
* `my_session_name`: a name for the credential session. If your IAM permissions require it to be in a certain format (such as starting with your IAM username), then you must adhere to the rule.
* `my_usual_region`: same as explained in the previous section.

### Usage
```shell
source aws-mfa-me <profile/role name>
```

Optional environment variables:
* `FORCE`: Ignore remaining session duration of target profile and force a refresh of credentials.
* `REFRESH_THRESH`: Value (minutes) above which a credential refresh will not be attempted. Defaults to 10 (minutes).
* `DURATION`: Session duration. Defaults to 3600 (seconds).
* `REGION`: Session region. Defaults `duration` as defined in AWS profile configs (role takes precedence over source profile).
* `ROLE_ARN`: Custom role ARN for when it is not defined in the AWS profile configs.

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

Given a name, retrieve the corresponding EC2 instance's ID.

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

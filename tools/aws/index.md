[Back](../../README.md)

## Amazon Web Services

[AWS CLI installation instructions](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Glossary

- IAM - Identity and Access Management
- SES - Simple Email Service
- API Gateway - expose external API's for services
- Lambda

## AWS Vault

[AWS Vault GitHub page](https://github.com/99designs/aws-vault)

Tool for secure storage of AWS IAM credentials

### Installation

[Instructions](https://github.com/99designs/aws-vault#installing)

### Usage

- `aws-vault add <PROFILE>` - configure credentials for `<PROFILE>`
- `aws-vault exec <PROFILE> -- <COMMAND>` - execute `<COMMAND>` using `<PROFILE>` settings and credentials
- `aws-vault login <PROFILE>` - open AWS in browser logged into `<PROFILE>`
- `aws-vault list` - list all profiles & credentials

## CloudWatch

### Logs Insights

- Counting occurrences per time unit based on message text

  e.g. Counts occurrences of "Retrying" log per 30 minutes
  ```
  fields @timestamp, @message, @logStream, @log
  | filter @message like /Retrying/
  | stats count() by bin(30m)
  ```

[Back](../../README.md)

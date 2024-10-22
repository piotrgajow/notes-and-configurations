[Back](../../README.md)

## Resources

- [Providers list and documentations](https://registry.terraform.io/browse/providers)
- [Official AWS modules](https://github.com/terraform-aws-modules)

## Commands

| Command                   | Description                                                 |
|:--------------------------|:------------------------------------------------------------|
| `terraform init`          | Initialize directory, download providers                    |
| `terraform init -upgrade` | Update directory, download new providers                    |
| `terraform fmt`           | Format configuration file                                   |
| `terraform validate`      | Validate configuration file                                 |
| `terraform plan`          | Preview changes to be done via `apply`                      |
| `terraform apply`         | Applies configuration                                       |
| `terraform show`          | Show data (IDs and properties) related to running instances |
| `terraform destroy`       | Removes running instances created during `apply`            |

Terraform uses files found in the working directory. To change the path `-chdir=` parameter can be used to pass with custom directory.

### AWS profile

To use terraform with AWS profile, set the profile name into `AWS_PROFILE` environment variable, or execute the commands with `AWS_PROFILE=<profileName> terraform <command>`

## Snippets

- [AWS - sending emails with lambda and SES](./aws-lambda-sending-mail.md)
- [AWS - API gateway for lambda](./aws-api-gateway-lambda.md)

[Back](../../README.md)

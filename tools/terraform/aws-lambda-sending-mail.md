[Back](./index.md)

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "<REGION>"
}

# Declare email address which will send the email
resource "aws_ses_email_identity" "<NAME>" {
  email = "<EMAIL_ADDRESS>"
}

# Declare assume role policy for lambda
data "aws_iam_policy_document" "<NAME>" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

# Declare send email policy for lambda
data "aws_iam_policy_document" "<NAME>" {
  statement {
    actions = [
      "ses:SendEmail",
    ]
    resources = [
      "*",
    ]
  }
}

# Define IAM policy
resource "aws_iam_policy" "<NAME>" {
  name   = "<NAME>"
  policy = data.aws_iam_policy_document.<NAME>.json
}

# Define IAM role
resource "aws_iam_role" "<NAME>" {
  name                = "<NAME>"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    aws_iam_policy.<NAME>.arn,
  ]
  assume_role_policy = data.aws_iam_policy_document.<NAME>.json
}

# Prepare zip package with lambda code
data "archive_file" "<NAME>" {
  type        = "zip"
  source_dir  = "${path.module}/<DIR_WITH_LAMBDA_CODE>"
  output_path = "${path.module}/<DIR_WITH_LAMBDA_CODE>.zip"
}

# Create lambda
resource "aws_lambda_function" "<NAME>" {
  role             = aws_iam_role.<NAME>.arn
  runtime          = "nodejs12.x"
  function_name    = "<NAME>"
  handler          = "index.handler"
  filename         = data.archive_file.<NAME>.output_path
  source_code_hash = filebase64sha256(data.archive_file.<NAME>.output_path)

  environment {
    variables = {
      EMAIL_ADDRESS = aws_ses_email_identity.<NAME>.email
    }
  }
}
```

```javascript
const AWS = require('aws-sdk');
const SES = new AWS.SES();
const CHARSET = 'UTF-8';

// If this was triggered from API gateway, `event.body` contains stringified HTTP request body
exports.handler = async (event) => {
    const emailParameters = {
        Source: process.env.EMAIL_ADDRESS,
        Destination: {
            // Email addresses to which the mail will be sent
            ToAddresses: [''],
        },
        Message: {
            Body: {
                // Body of the email
                // Can be `Text` instead of `Html`
                Html: {
                    Data: '',
                    Charset: CHARSET,
                }
            },
            Subject: {
                // Email subject
                Data: '',
                Charset: CHARSET,
            },
        },
    }
    const { MessageId } = await SES.sendEmail(emailParameters).promise();
    console.log(MessageId);
    return { statusCode: 200, body: { result: "Mail sent" } };
};
```

[Back](./index.md)

[Back](./index.md)

```terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "<REGION>"
}

# Declare HTTP API
resource "aws_apigatewayv2_api" "<NAME>" {
  name          = "<NAME>"
  protocol_type = "HTTP"
}

# Define cloudwatch settings for API
resource "aws_cloudwatch_log_group" "<NAME>" {
  name              = "/aws/api_gw/${aws_apigatewayv2_api.<NAME>.name}"
  retention_in_days = <LOG_RETENTION>
}

# Define API gateway stage & logging settings
resource "aws_apigatewayv2_stage" "<NAME>" {
  api_id      = aws_apigatewayv2_api.<NAME>.id
  name        = "<NAME>"
  auto_deploy = true
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.<NAME>.arn
    format          = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
    })
  }
}

# Define integration between API and lambda
resource "aws_apigatewayv2_integration" "<NAME>" {
  api_id             = aws_apigatewayv2_api.<NAME>.id
  integration_uri    = aws_lambda_function.<NAME>.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

# Define HTTP endpoint that will trigger integration
# <ROUTE>: GET /path/to/resource
resource "aws_apigatewayv2_route" "<NAME>" {
  api_id    = aws_apigatewayv2_api.<NAME>.id
  route_key = "<ROUTE>"
  target    = "integrations/${aws_apigatewayv2_integration.<NAME>.id}"
}

# Add permission for gateway API to execute lambda
resource "aws_lambda_permission" "<NAME>" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.<NAME>.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.<NAME>.execution_arn}/*/*"
}
```

[Back](./index.md)

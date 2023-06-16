locals {
  function_name = "${var.namespace}-cloudfront-cache-invalidator"
}

resource "aws_iam_role" "cloudfront_cache_invalidator" {
  name = "${local.function_name}-execution-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts.AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = { Service = "lambda.amazonaws.com" }
      }
    ]
  })
}

resource "aws_iam_policy" "cloudfront_cache_invalidator" {
  name        = "${local.function_name}-policy"
  description = "IAM policy for Lambda function."
  policy      = file("templates/lambda_policy.json")
}

resource "aws_iam_role_policy_attachment" "cloudfront_cache_invalidator" {
  role       = aws_iam_role.cloudfront_cache_invalidator.name
  policy_arn = aws_iam_policy.cloudfront_cache_invalidator.arn
}

resource "aws_cloudwatch_log_group" "cloudfront_cache_invalidator" {
  name              = "/aws/lambda/${aws_lambda_function.cloudfront_cache_invalidator.function_name}"
  retention_in_days = 30
}

data "archive_file" "cloudfront_cache_invalidator" {
  type        = "zip"
  source_dir  = "../aws_lambda/cloudfront_cache_invalidator"
  output_path = "../.deployment_packages/cloudfront_cache_invalidator.zip"
  excludes    = ["__init__.py", "__pycache__"]
}

resource "aws_lambda_function" "cloudfront_cache_invalidator" {
  filename      = "../.deployment_packages/cloudfront_cache_invalidator.zip"
  function_name = local.function_name
  role          = aws_iam_role.cloudfront_cache_invalidator.arn
  handler       = "main.handler"

  source_code_hash = data.archive_file.cloudfront_cache_invalidator.output_base64sha256

  runtime = "python3.9"

  environment {
    variables = {
      CLOUDFRONT_DISTRIBUTION_ID = aws_cloudfront_distribution.www_distribution.id
    }
  }
}

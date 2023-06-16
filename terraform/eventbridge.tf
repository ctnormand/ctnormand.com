resource "aws_cloudwatch_event_rule" "s3_create_or_delete" {
  name        = "${var.namespace}-s3-create-or-delete"
  description = "Captures object creation or deletion in specified S3 bucket."

  event_pattern = jsonencode({
    source      = ["aws.s3"]
    detail-type = ["Object Deleted", "Object Created"]
    detail = {
      bucket = {
        name = [module.www_bucket.s3_bucket_id]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "cloudfront_cache_invalidator" {
  rule      = aws_cloudwatch_event_rule.s3_create_or_delete.name
  target_id = aws_lambda_function.cloudfront_cache_invalidator.function_name
  arn       = aws_lambda_function.cloudfront_cache_invalidator.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.cloudfront_cache_invalidator.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_create_or_delete.arn
}

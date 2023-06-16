<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | 2.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.67.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.5.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.4.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_aws.acm_provider"></a> [aws.acm\_provider](#provider\_aws.acm\_provider) | 4.67.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_root_bucket"></a> [root\_bucket](#module\_root\_bucket) | terraform-aws-modules/s3-bucket/aws | n/a |
| <a name="module_www_bucket"></a> [www\_bucket](#module\_www\_bucket) | terraform-aws-modules/s3-bucket/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.root_distribution](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_distribution.www_distribution](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudwatch_event_rule.s3_create_or_delete](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.allow_eventbridge](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/lambda_permission) | resource |
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route53_record) | resource |
| [aws_route53_record.root_a](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route53_record) | resource |
| [aws_route53_record.www_a](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route53_record) | resource |
| [random_password.root_referer_key](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/password) | resource |
| [random_password.www_referer_key](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/password) | resource |
| [archive_file.cloudfront_cache_invalidator](https://registry.terraform.io/providers/hashicorp/archive/2.4.0/docs/data-sources/file) | data source |
| [aws_default_tags.default_tags](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/default_tags) | data source |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket without the www prefix. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the website. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace used to identify resources in this deployment. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
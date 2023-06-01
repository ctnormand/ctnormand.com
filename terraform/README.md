<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_aws.acm_provider"></a> [aws.acm\_provider](#provider\_aws.acm\_provider) | 4.67.0 |

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
| [aws_route53_record.cert_validation](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route53_record) | resource |
| [aws_route53_record.root_a](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route53_record) | resource |
| [aws_route53_record.www_a](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/4.67.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket without the www prefix. | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags that will be applied to all components. | `any` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the website. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
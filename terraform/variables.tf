variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket without the www prefix."
}

variable "common_tags" {
  description = "Common tags that will be applied to all components."
}

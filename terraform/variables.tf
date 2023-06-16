variable "namespace" {
  type        = string
  description = "Namespace used to identify resources in this deployment."
}

variable "domain_name" {
  type        = string
  description = "The domain name for the website."
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket without the www prefix."
}

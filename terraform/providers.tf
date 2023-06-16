terraform {
  backend "s3" {
    bucket = "databasement-terraform"
    key    = "ctnormand.com/state.tfstate"
    region = "us-east-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      namespace = "portfolio-prd"
      terraform = "true"
    }
  }
}

# SSL certificate must be requested in us-east-1 for use with CloudFront.
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}

provider "random" {}

provider "archive" {}

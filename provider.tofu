terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.50"
    }
  }
}

provider "aws" {
  profile = "coco-default"
  region  = "eu-north-1"

  default_tags {
    tags = local.common_tags
  }
}
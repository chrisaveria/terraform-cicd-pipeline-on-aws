terraform {
  backend "s3" {
    bucket         = "hyc-tf-state-281167210162-cn-north-1"
    key            = "terraform/state/cicd-pipeline-on-aws.json"
    dynamodb_table = "hyc-tf-state-281167210162-cn-north-1-table"
    region         = "cn-north-1"
    profile        = "281167210162_UserFull"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# A simple SNS topic resources 
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic
resource "aws_sns_topic" "user_updates" {
  name = "user-updates-topic"
}

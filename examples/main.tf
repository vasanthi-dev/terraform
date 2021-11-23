provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-dev60"
    key    = "example/sample/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ec2" {
  source = "./ec2"
  SGID   = module.securitygroup.SGID
  name   = ["new1", "new2"]
}

module "securitygroup" {
  source = "./securitygroup"
}


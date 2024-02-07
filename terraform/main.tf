variable "prj_prefix" {}
variable "environment" {}

variable "region_site" {}
variable "region_acm" {}

variable "route53_zone_id" {}
variable "domain_static_site" {}


provider "aws" {
  region = var.region_site
}

terraform {
  backend "s3" {
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.2"
      #version = "~> 5.35.0"
    }
  }
}

module "module_static_site" {
  source             = "./modules/static_site"
  prj_prefix         = var.prj_prefix
  route53_zone_id    = var.route53_zone_id
  domain_static_site = var.domain_static_site
  region_site        = var.region_site
  region_acm         = var.region_acm
}


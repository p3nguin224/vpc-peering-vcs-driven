terraform {
  required_version = "1.16.6"
  cloud {
    organization = "thawzin-tfc"
    workspaces {
      name = "vpc-peering-fe-to-be"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}



# Configure the AWS Provider
provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "backend"
  region = var.peer-region
}

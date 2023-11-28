# providers.tf

terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = "~> 4.63"
  }
}


terraform {
  required_version = "~> 1.3"
#  required_version = ">= 1.3"

  required_providers {
    aws = {
source = "hashicorp/aws"
version = "4.12.0"
    }

  }
}
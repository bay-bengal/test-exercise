provider "aws" {
  region  = var.region
  profile = var.profile
}

provider "aws" {
  alias   = "infra-sharedservices-deploy"
  region  = var.region
  profile = "infra-sharedservices-deploy"
}



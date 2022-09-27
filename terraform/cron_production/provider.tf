provider "aws" {
  region  = data.terraform_remote_state.main_service.outputs.region
  profile = data.terraform_remote_state.main_service.outputs.profile
}

provider "aws" {
  alias   = "infra-sharedservices-deploy"
  region  = data.terraform_remote_state.main_service.outputs.region
  profile = "infra-sharedservices-deploy"
}



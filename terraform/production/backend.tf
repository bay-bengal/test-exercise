# Reminder
# Variable are not supported in backend block.
# More info availble at https://github.com/hashicorp/terraform/issues/22088#issuecomment-521056027
#
# Remember to change the path of the key. It must be unique!
#
terraform {
  backend "s3" {
    bucket         = "zmarta-open-tf-state-bucket"
    key            = "xxxxx-prod/terraform.tfstate"
    region         = "eu-west-1"
    profile        = "infra-sharedservices-deploy"
    dynamodb_table = "Terraform-State-Lock-Deployed-Projects"
  }
}

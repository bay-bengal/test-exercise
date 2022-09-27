# These are the variables you have to adjust before deploying


#############################################################################
# Remote state from the main service
# Change the path of the key to fit your needs
#############################################################################

data "terraform_remote_state" "main_service" {
  backend = "s3"
  config = {
    bucket  = "zmarta-open-tf-state-bucket"
    key     = "xxxxx/terraform.tfstate"
    region  = "eu-west-1"
    profile = "infra-sharedservices-deploy"
  }
}



#############################################################################
# Most values are picked from the main configuration,
# but we will set these values independantly
#############################################################################


# Size of vCPU
variable "cpu" {
  default = 256
}

# Size of memory
variable "memory" {
  default = 512
}



#############################################################################
# Here we configure all the cron entries
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html
# https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerOverride.html
#############################################################################

variable "cron_list" {
  default = [
    {
      "schedule_expression" = "Your schedule expression"
      "cmd_line"            = ["command", "arg1"]
    },
    {
      "schedule_expression" = "Another schedule expression"
      "cmd_line"            = ["other-command", "arg1"]
    },
  ]
}

# Example:
#
# variable "cron_list" {
#   default = [
#     {
#       "schedule_expression" = "rate(1 minute)"
#       "cmd_line"            = ["./program", "--cron=secret"]
#     },
#     {
#       "schedule_expression" = "cron(0,5,10,15,20,25,30,35,40,45,50,55 * * * ? *)"
#       "cmd_line"            = ["./program", "--cron=hi"]
#     },
#   ]
# }

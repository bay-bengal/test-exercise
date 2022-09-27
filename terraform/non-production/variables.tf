# These are the variables you have to adjust before deploying
# They are put in different sections to make it easier to know what to change




#############################################################################
# These variables are unique for every combination of environment and project
# The project_name must be unique. The other default values might work as
# they are.
#############################################################################

# The name of the project
variable "project_name" {
  default = "project_test"
}

# The environment, like non-production, test, staging ...
variable "environment" {
  default = "non-production"
}

# Size of vCPU
variable "cpu" {
  default = 256
}

# Size of memory
variable "memory" {
  default = 512
}

# How many tasks will run?
variable "desired_count" {
  default = 1
}

# Port used by the container
variable "container_port" {
  default = "3000"
}

# You can put what you want in billing_id to track your cost.
# The resources will be tagged with this id.
variable "billing_id" {
  default = "billing_id"
}

# Autoscaling Max Capacity
variable "max_capacity" {
  default = "2"
}

# Autoscaling Min Capacity
variable "min_capacity" {
  default = "1"
}

# Autoscaling Target Value (% CPU)
variable "target_value" {
  default = "70"
}

# Autoscaling scale_in_cooldown (Seconds)
variable "scale_in_cooldown" {
  default = "60"
}

# Autoscaling scale_out_cooldown (Seconds)
variable "scale_out_cooldown" {
  default = "60"
}


# Array of maps with the shape { name, value } that defines environment
# variables
variable "environment_variables" {
  default = [{
    name  = "NODE_ENV",
    value = "production"
  }]
}

# Array of maps with the shape { name, valueFrom } or { name, key }
# that defines secrets that gets defined as environment variables.
# valueFrom requries the full arn, key only requires the key in the secret
# terraform creates for you
variable "secrets" {
  default = null
}

# Should an X-Origin-Token be created for the ALB? true or false.
# If created the header must be present when talking to the ALB for this service.
# This is a must if the ALB will be public and only accessible from
# Cloudfront or similar service.
variable "x_origin_token" {
  default = false
}



#############################################################################
# These variables are unique for the account/region.
# If you are deploying a new project in the same account/region as other
# projects you can probably copy the values from the other projects.
#############################################################################

# The region we will deploy in
variable "region" {
  default = "eu-west-1"
}

# The profile that wil be used for talking to AWS
# The profiles are typically configured in ~/.aws/config
variable "profile" {
  default = "profile-name"
}

# VPC
variable "vpc_id" {
  default = "vpc-0507cc15de5517106"
}

# The id of the ECS cluster
variable "ecs_cluster_id" {
  default = "Put your cluster id here"
}

# The name of the ECS cluster
variable "ecs_cluster_name" {
  default = "main-cluster"
}

# The ARN of the listener in the ALB
variable "listener_arn" {
  default = "Arn of the listener"
}

# The subnets where tasks can run
variable "subnets" {
  default = ["subnet-04eabac5e9569c055", "subnet-07dcc1e1b9edb5810", "subnet-0ccf718ab793bcac0"]
}

# Domain used for the service
variable "domain" {
  default = "non-production.internal.zmarta.org"
}

# Hosted zone ID for the Domain
variable "domain_zone_id" {
  default = "Z02624181FNOHDZ5W63BM"
}

# DNS name for the ALB
variable "alb_dns_name" {
  default = "alb_dns_name"
}

#############################################################################
# These variables are probably valid in every configuration
#############################################################################

# Hosted zone ID for the ALB
variable "alb_zone_id" {
  default = "Z32O12XQLNTSW2"
}

# The GitHub Actions Deploy Role Name
variable "github_actions_deploy_role_name" {
  default = "github-deploy-role"
}

# The role xray will assume
variable "xray_assume_role" {
  default = "arn:aws:iam::715140016261:role/xray-assume-role20210409120953608100000001"
}

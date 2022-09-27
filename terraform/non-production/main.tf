module "codepipeline" {
  source             = "git@github.com:OCP-Zmarta/terraform-deploy-project-module-codepipeline?ref=v0.1.2"
  project_name       = var.project_name
  region             = var.region
  vpc_id             = var.vpc_id
  ecs_cluster_id     = var.ecs_cluster_id
  ecs_cluster_name   = var.ecs_cluster_name
  listener_arn       = var.listener_arn
  desired_count      = var.desired_count
  subnets            = var.subnets
  port               = var.container_port
  cpu                = var.cpu
  memory             = var.memory
  domain             = var.domain
  billing_id         = var.billing_id
  xray_assume_role   = var.xray_assume_role
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  target_value       = var.target_value
  scale_in_cooldown  = var.scale_in_cooldown
  scale_out_cooldown = var.scale_out_cooldown
  prometheus_hosts   = data.terraform_remote_state.common_vars.outputs.prometheus_hosts
  x_origin_token     = var.x_origin_token
}

module "github_actions_workflows" {
  source                  = "git@github.com:OCP-Zmarta/terraform-deploy-project-module-github-actions?ref=v0.0.13"
  project_name            = var.project_name
  region                  = var.region
  environment             = var.environment
  s3_bucket               = module.codepipeline.aws_s3_bucket_source_name
  github_actions_role_arn = data.aws_iam_role.github_actions_deploy_role.arn
  billing_id              = var.billing_id
}

module "deploy_files" {
  source                = "git@github.com:OCP-Zmarta/terraform-deploy-project-module-deploy-files?ref=v0.0.3"
  project_name          = var.project_name
  environment           = var.environment
  region                = var.region
  taskdefinition_arn    = module.codepipeline.taskdefinition_arn
  port                  = var.container_port
  cpu                   = var.cpu
  memory                = var.memory
  registry_url          = module.codepipeline.registry_url
  execution_role_arn    = module.codepipeline.execution_role_arn
  task_role_arn         = module.codepipeline.task_role_arn
  secret_arn            = module.codepipeline.secret_arn
  billing_id            = var.billing_id
  xray_assume_role      = var.xray_assume_role
  environment_variables = var.environment_variables
  secrets               = var.secrets
}

data "terraform_remote_state" "common_vars" {
  backend = "s3"
  config = {
    bucket  = "zmarta-open-tf-state-bucket"
    key     = "common_vars_module/terraform.tfstate"
    region  = "eu-west-1"
    profile = "infra-sharedservices-deploy"
  }
}

data "aws_iam_role" "github_actions_deploy_role" {
  name = var.github_actions_deploy_role_name
}

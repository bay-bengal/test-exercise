output "project_name" {
  value = var.project_name
}

output "environment" {
  value = var.environment
}

output "billing_id" {
  value = var.billing_id
}

output "region" {
  value = var.region
}

output "profile" {
  value = var.profile
}

output "vpc_id" {
  value = var.vpc_id
}

output "ecs_cluster_id" {
  value = var.ecs_cluster_id
}

output "ecs_cluster_name" {
  value = var.ecs_cluster_name
}

output "subnets" {
  value = var.subnets
}

output "github_actions_deploy_role_arn" {
  value = data.aws_iam_role.github_actions_deploy_role.arn
}

output "github_actions_deploy_role_name" {
  value = data.aws_iam_role.github_actions_deploy_role.name
}

output "xray_assume_role" {
  value = var.xray_assume_role
}

output "secret_arn" {
  value = module.codepipeline.secret_arn
}

output "registry_url" {
  value = module.codepipeline.registry_url
}

output "taskdefinition_arn" {
  value = module.codepipeline.taskdefinition_arn
}


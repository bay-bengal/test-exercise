# CODE PIPELINE
#
# https://docs.aws.amazon.com/codepipeline/latest/userguide/reference-pipeline-structure.html

resource "aws_codepipeline" "codepipeline" {
  name     = var.project_name
  role_arn = module.codepipeline.codepipeline_role

  artifact_store {
    location = module.codepipeline.codepipeline_bucket
    type     = "S3"
  }

  stage {
    name = "Sources"

    action {
      name             = "Source_S3"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket    = module.codepipeline.codepipeline_source_bucket
        S3ObjectKey = "codepipeline.zip"
      }
    }
  }

  stage {
    name = "Deploy"

    #action {
    #  name      = "Approval"
    #  category  = "Approval"
    #  owner     = "AWS"
    #  provider  = "Manual"
    #  version   = "1"
    #  run_order = "1"
    #}

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeployToECS"
      input_artifacts = ["source_output"]
      version         = "1"
      run_order       = "1"

      configuration = {
        ApplicationName                = module.codepipeline.codedeploy.name
        DeploymentGroupName            = module.codepipeline.codedeploy_deployment_group.deployment_group_name
        TaskDefinitionTemplateArtifact = "source_output"
        AppSpecTemplateArtifact        = "source_output"
      }
    }
  }

  tags = {
    Config     = "deploy-project/terraform/module_codepipeline/code_pipeline.tf",
    Name       = var.project_name,
    Billing-Id = var.billing_id
  }
}

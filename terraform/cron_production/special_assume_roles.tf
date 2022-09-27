# If the task needs permission to assume other
# roles you need to give it permission to do so.
# Below you find an example of how to give such
# a permission.



#resource "aws_iam_role_policy" "s3_access_el-mediating-files-non-prod20220131125111774000000001" {
#  count       = length(var.cron_list)
#  name_prefix = "s3-access-${data.terraform_remote_state.main_service.outputs.project_name}"
#  role        = module.cron[count.index].task_role_id
#
#  policy = <<EOF
#{
#    "Version": "2012-10-17",
#    "Statement": [
#        {
#            "Action": [
#                "s3:GetObject",
#                "s3:PutObject"
#            ],
#            "Effect": "Allow",
#            "Resource": [
#                "arn:aws:s3:::el-mediating-files-non-prod20220131125111774000000001/",
#                "arn:aws:s3:::el-mediating-files-non-prod20220131125111774000000001/*"
#            ]
#        }
#    ]
#}
#EOF
#}


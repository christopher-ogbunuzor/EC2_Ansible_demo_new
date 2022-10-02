# resource "aws_config_config_rule" "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS" {
#   name = "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS"

#   source {
#     owner             = "AWS"
#     source_identifier = "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS"
#   }

#     input_parameters = <<EOF
# {
#   "authorizedTcpPorts": "8080"
# }
# EOF

#   depends_on = ["aws_config_configuration_recorder.foo"]
# }


# resource "aws_config_config_rule" "cloud_trail_enabled" {
#   name = "cloud_trail_enabled"

#   source {
#     owner             = "AWS"
#     source_identifier = "CLOUD_TRAIL_ENABLED"
#   }
#     scope {
#     compliance_resource_types = []
#   }

# #   input_parameters = <<EOF
# # {
# #   "s3BucketName": "cloudwatch-to-s3-logs"
# # }
# # EOF

#   depends_on = ["aws_config_configuration_recorder.foo"]
# }

# resource "aws_config_config_rule" "s3_bucket_versioning_enabled" {
#   name = "s3_bucket_versioning_enabled"

#   source {
#     owner             = "AWS"
#     source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
#   }
#   scope {
#     compliance_resource_types = ["AWS::S3::Bucket"]
#   }

#   depends_on = ["aws_config_configuration_recorder.foo"]
# }

# resource "aws_config_config_rule" "dynamodb-table-encryption-enabled" {
#   name = "dynamodb-table-encryption-enabled"
#   description = "A config rule that checks whether the Amazon DynamoDB tables are encrypted and checks their status. The rule is COMPLIANT if the status is enabled or enabling."

#   source {
#     owner = "AWS"
#     source_identifier = "DYNAMODB_TABLE_ENCRYPTION_ENABLED"
#   }
#   scope {
#     compliance_resource_types = ["AWS::DynamoDB::Table"]
#   }
#     depends_on = ["aws_config_configuration_recorder.foo"]

# }



# resource "aws_config_configuration_recorder" "foo" {
#   name     = "config-recorder"
#   role_arn = aws_iam_role.r.arn

#    recording_group {
#     all_supported                 = true
#     include_global_resource_types = true
#   }
# }

# resource "aws_s3_bucket" "my-config-bucket" {
#   bucket = "config-bucket-for-my-test-project-12345"
#   acl    = "private"

#   versioning {
#     enabled = true
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "aws_config_delivery_channel" "my-config" {
#   name           = "config-example"
#   s3_bucket_name = "${aws_s3_bucket.my-config-bucket.bucket}"

#   depends_on = ["aws_config_configuration_recorder.my-config"]
# }

# resource "aws_config_configuration_recorder_status" "config" {
#   name       = "${aws_config_configuration_recorder.foo.name}"
#   is_enabled = true

#   depends_on = ["aws_config_delivery_channel.my-config"]
# }

# resource "aws_iam_role" "r" {
#   name = "my-awsconfig-role"

#   assume_role_policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "config.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# POLICY
# }

# resource "aws_iam_role_policy" "p" {
#   name = "my-awsconfig-policy"
#   role = aws_iam_role.r.id

#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Statement": [
#       {
#           "Action": "config:Put*",
#           "Effect": "Allow",
#           "Resource": "*"

#       }
#   ]
# }
# POLICY
# }
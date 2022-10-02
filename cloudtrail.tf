data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "mytrail" {
  name                          = "dockerapplicationTrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrailbucket.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
  enable_log_file_validation = true
#   kms_key_id = aws_kms_key.my_kms_key.key_id
}

resource "aws_s3_bucket" "cloudtrailbucket" {
  bucket        = "cloudtrailbucket-12345"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_bucket" {
  bucket = aws_s3_bucket.cloudtrailbucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_policy" "cloudtrailbucket-policy" {
  bucket = aws_s3_bucket.cloudtrailbucket.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${aws_s3_bucket.cloudtrailbucket.arn}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.cloudtrailbucket.arn}/prefix/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}

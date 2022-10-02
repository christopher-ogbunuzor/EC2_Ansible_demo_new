resource "aws_iam_role" "SlaveServerRole" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY


  managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",]
  max_session_duration = "3600"
  name                 = "SlaveServerRole"
}

resource "aws_iam_instance_profile" "ec2_instanceprofile" {
  name = "ec2_instanceprofile"
  role = "${aws_iam_role.SlaveServerRole.name}"
}

output "ec2_instance_ip" {
 value = aws_instance.my_public_server.public_ip
  # value = aws_instance.my
}


output "key_id" {
  value = aws_kms_key.my_kms_key.id
}

output "key_arn" {
  value = aws_kms_key.my_kms_key.arn
}
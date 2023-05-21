output "ec2_instance_ip_first" {
 value = aws_instance.my_public_server1.public_ip
  # value = aws_instance.my
}
output "ec2_instance_ip_second" {
 value = aws_instance.my_public_server2.public_ip
  # value = aws_instance.my
}
terraform {
  backend "s3"{
      bucket = "my-first-lambdabucket-194694014750"
      key = "sprint3/week6/ec2-ansible/terraform.tfstate"
      dynamodb_table = "terraform-lock"
      
  }
}
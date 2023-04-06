provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "macos_instance" {
  ami           = "ami-04a4b4ad77ec4f375" 
  instance_type = "mac1.metal"           

  vpc_security_group_ids = ["sg-0e609882ca5d75961"] # Replace with the ID of the security group you want to use

  tags = {
    Name = "My macOS Instance"
  }

  key_name = "mykey" # Replace with the name of your EC2 key pair

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, world!"
              EOF
}
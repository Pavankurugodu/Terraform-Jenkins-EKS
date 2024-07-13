# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
data "aws_ami" "ubuntu22" {
  most_recent = true
  owners      = ["amazon"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-*"]


  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu22.id
  instance_type               = "t2.small"
  key_name                    = "terraform-key"
  subnet_id                   = aws_subnet.myjenkins-server-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins-server.sh")

  tags = {
    Name = "${var.env_prefix}-Jenkins-server"
  }

}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}
# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "HelloWorld"
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-20240701"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }  
}

resource "aws_instance" "web" {
  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               =  var.instance_type
  key_name                    = "terraform-key"
  subnet_id                   = aws_subnet.myjenkins-server-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  user_data                   = "${file("jenkins-server-setup.sh")}" 

  tags = {
    Name = "${var.env_prefix}-Jenkins-server"
  }

}
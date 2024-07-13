output "ec2_public_ip" {
  value = aws_instance.myjenkins-server.public_ip
}
variable "vpc_cidr_block" {
  type        = string
  description = "To Set the cidr for VPC"
}

variable "subnet_cidr_block" {
  type        = string
  description = "To set cidr for Subnet"
}

variable "availability_zone" {
  type        = string
  description = "To Set Availablility Zone"
}

variable "env_prefix" {
  type        = string
  description = "This is to set DEV or Prod or QA"
}

variable "instance_type" {
  type        = string
  description = "To set desried instance type for aws Ec2 instance"

}
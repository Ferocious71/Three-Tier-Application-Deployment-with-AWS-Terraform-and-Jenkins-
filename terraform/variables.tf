variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "jenkins_instance_type" {
  default = "t3.medium"
}


variable "backend_security_group" {
  type = string
}

variable "frontend_security_group" {
  type = string
}

variable "mongo_security_group" {
  type = string
}

variable "key_name" {
  type = string
}


variable "vpc_id" {
  default = "vpc-09f02049d6176fe30"  # Replace with your Default VPC ID
}

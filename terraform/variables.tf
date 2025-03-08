variable "aws_region" {
  default = "us-east-1"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "instance_type" {
  description = "Instance type for backend and frontend"
  type        = string
  default     = "t2.micro"
}

variable "jenkins_instance_type" {
  description = "Instance type for Jenkins"
  type        = string
  default     = "t3.medium"
}


variable "vpc_id" {
  default = "vpc-09f02049d6176fe30"  # Replace with your Default VPC ID
}

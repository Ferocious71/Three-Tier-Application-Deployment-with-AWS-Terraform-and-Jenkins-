resource "aws_security_group" "sal-mongo_sg" {
  name        = "sal-mongo_sg"
  description = "Security group for MongoDB"
  vpc_id      = "vpc-09f02049d6176fe30"

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sal-backend_sg" {
  name        = "sal-backend_sg"
  description = "Security group for Backend"
  vpc_id      = "vpc-09f02049d6176fe30"

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sal-frontend_sg" {
  name        = "sal-frontend_sg"
  description = "Security group for Frontend"
  vpc_id      = "vpc-09f02049d6176fe30"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sal-jenkins_sg" {
  name        = "sal-jenkins_sg"
  description = "Security group for Jenkins"
  vpc_id      = "vpc-09f02049d6176fe30"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

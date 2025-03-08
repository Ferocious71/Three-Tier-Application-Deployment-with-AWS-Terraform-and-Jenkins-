resource "aws_security_group" "sal-mongo_sg" {
  name        = "mongo-security-group"
  description = "Allow MongoDB traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Allow internal access
  }
}

resource "aws_security_group" "sal-backend_sg" {
  name        = "backend-security-group"
  description = "Allow backend traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

resource "aws_security_group" "sal-frontend_sg" {
  name        = "frontend-security-group"
  description = "Allow frontend traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sal-jenkins_sg" {
  name        = "jenkins-security-group"
  description = "Allow Jenkins traffic"
  vpc_id      = var.vpc_id

  # Allow Jenkins access
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open for public access (Adjust as needed)
  }

  # Allow SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open for SSH access (Restrict in production)
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

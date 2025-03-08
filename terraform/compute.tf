resource "aws_instance" "mongodb" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  security_groups = [aws_security_group.sal-mongo_sg.id] # Fixed
  key_name      = var.key_name

  user_data = file("scripts/mongo_setup.sh")

  tags = {
    Name = "Sal-MongoDB-Instance"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  security_groups = [aws_security_group.sal-backend_sg.id] # Fixed
  key_name      = var.key_name

  user_data = file("scripts/backend_setup.sh")

  tags = {
    Name = "Sal-Backend-Instance"
  }
}

resource "aws_instance" "frontend" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  security_groups = [aws_security_group.sal-frontend_sg.id] # Fixed
  key_name      = var.key_name

  user_data = templatefile("scripts/frontend_setup.sh", {
    backend_private_ip = aws_instance.backend.private_ip
  })

  tags = {
    Name = "Sal-Frontend-Instance"
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.jenkins_instance_type
  security_groups = [aws_security_group.sal-jenkins_sg.id] # Fixed
  key_name      = var.key_name

  user_data = file("scripts/jenkins_install.sh")

  tags = {
    Name = "Sal-Jenkins-Instance"
  }
}

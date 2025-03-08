resource "aws_instance" "mongodb" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sal-mongo_sg.id] # Use direct reference
  key_name               = var.key_name
  subnet_id              = var.subnet_id

  user_data = file("scripts/mongo_setup.sh")

  depends_on = [aws_security_group.sal-mongo_sg] # Ensure SG is created first

  tags = {
    Name = "Sal-MongoDB-Instance"
  }
}

resource "aws_instance" "backend" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sal-backend_sg.id] # Use direct reference
  key_name               = var.key_name
  subnet_id              = var.subnet_id


  user_data = file("scripts/backend_setup.sh")

  depends_on = [aws_security_group.sal-backend_sg] # Ensure SG is created first

  tags = {
    Name = "Sal-Backend-Instance"
  }
}

resource "aws_instance" "frontend" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sal-frontend_sg.id] # Use direct reference
  key_name               = var.key_name
  subnet_id              = var.subnet_id


  user_data = templatefile("scripts/frontend_setup.sh", {
    backend_private_ip = aws_instance.backend.private_ip
  })

  depends_on = [aws_security_group.sal-frontend_sg, aws_instance.backend] # Ensure SG and backend are created first

  tags = {
    Name = "Sal-Frontend-Instance"
  }
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = var.jenkins_instance_type
  vpc_security_group_ids = [aws_security_group.sal-jenkins_sg.id] # Use direct reference
  key_name               = var.key_name
  subnet_id              = var.subnet_id

  user_data = file("scripts/jenkins_install.sh")

  depends_on = [aws_security_group.sal-jenkins_sg] # Ensure SG is created first

  tags = {
    Name = "Sal-Jenkins-Instance"
  }
}

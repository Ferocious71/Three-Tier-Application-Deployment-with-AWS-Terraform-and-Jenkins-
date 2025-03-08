#!/bin/bash
set -e  # Stop execution if any command fails

# Update package lists
sudo apt update -y

# Install Java (Jenkins requires Java)
sudo apt install -y openjdk-17-jdk

# Add Jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] http://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package lists again
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Allow Jenkins through the firewall
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw --force enable

# Display Jenkins initial admin password
echo "Jenkins installed successfully. Initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

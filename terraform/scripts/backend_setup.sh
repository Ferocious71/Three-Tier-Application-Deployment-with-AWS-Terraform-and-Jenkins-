#!/bin/bash
sudo apt update
sudo apt install -y nodejs npm git

# Clone your forked repository into /home/ubuntu/app
git clone https://github.com/Ferocious71/Three-Tier-Application-Deployment-with-AWS-Terraform-and-Jenkins-.git /home/ubuntu/app

# Navigate to the backend folder inside the cloned repository
cd /home/ubuntu/app/backend

# Install backend dependencies
npm install

# Set up environment variables
echo "MONGO_URI=mongodb://$(terraform output mongo_private_ip):27017/mydb" > .env

# Start the backend server
npm start
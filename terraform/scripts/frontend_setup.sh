#!/bin/bash
sudo apt update
sudo apt install -y nginx nodejs npm

# Clone your frontend repository
git clone https://github.com/Ferocious71/Three-Tier-Application-Deployment-with-AWS-Terraform-and-Jenkins-.git /var/www/html/frontend

# Move into the frontend directory
cd /var/www/html/frontend

# Replace BACKEND_URL with actual Backend Private IP from Terraform
sed -i 's|BACKEND_URL|http://'"$(terraform output backend_private_ip)"':3001|' src/url.js

# Install dependencies and build the frontend
npm install
npm run build
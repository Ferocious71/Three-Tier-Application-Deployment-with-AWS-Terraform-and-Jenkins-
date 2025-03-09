# Three-Tier Application Deployment with AWS, Terraform, and Jenkins

AWS Infrastructure:

1. Use the default VPC and existing subnets for simplicity
2. Deploy EC2 instances for each tier with appropriate security groups
3. Implement proper network isolation between tiers
4. Configure instances using Terraform user data or provisioners

- Instance Created 
![image](https://github.com/user-attachments/assets/ada042b5-1c0b-4f2a-89c0-dc5e6f510155)

![image](https://github.com/user-attachments/assets/ffbd95dc-f9ad-4468-8e78-1b64328ae2bf)

- Resources destroyed
![image](https://github.com/user-attachments/assets/56e7f079-8d6a-49cb-b9fd-0c762235b54c)

Server Configuration:

1. Configure MongoDB instance with proper security using Terraform
2. Set up the backend with correct environment variables
3. Configure the frontend to connect to the backend
4. Use Terraform provisioners or user data to handle application installation

- Frontend running on EC2 -instance provisioned from Terraform
![image](https://github.com/user-attachments/assets/bd0e5586-15d2-4d49-aa14-f2cf738f1f24)

- Backend running on EC2 -instance provisioned from Terraform
![image](https://github.com/user-attachments/assets/53701e78-205d-4e75-ac7a-031f709c215a)

![image](https://github.com/user-attachments/assets/8a105910-5a3b-47ba-a369-3ad1b6fe376c)

- Data persistence int Mongo db
![image](https://github.com/user-attachments/assets/fd44b7bc-b3ba-43c9-aba9-a7a40b1d1713)


CI/CD Pipeline:

1. Implement a Jenkins pipeline for automated deployment
2. Include stages for infrastructure provisioning and application deployment
3. Add validation and testing stages
4. Manage application code deployment directly from Jenkins

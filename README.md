# Three-Tier Application Deployment with AWS, Terraform, and Jenkins

AWS Infrastructure:

1. Use the default VPC and existing subnets for simplicity
2. Deploy EC2 instances for each tier with appropriate security groups
3. Implement proper network isolation between tiers
4. Configure instances using Terraform user data or provisioners
5. Total 8 resources created from Terraform (4 Ec2 instance (frontend,backend,mongodb, jenkins), 4-Security Groups).
- Instance Created 
![image](https://github.com/user-attachments/assets/1a04f5f1-5f5e-4c6b-89be-902a4313bb72)

![image](https://github.com/user-attachments/assets/ffbd95dc-f9ad-4468-8e78-1b64328ae2bf)

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

- Jenkins Running
![image](https://github.com/user-attachments/assets/79050a8d-b532-43be-98f6-8b20be6c6540)

![image](https://github.com/user-attachments/assets/7e228ac8-8382-4303-b5e3-b74dd62f0033)

![image](https://github.com/user-attachments/assets/259246e2-48c3-4374-8de0-dd5f68ccfff8)




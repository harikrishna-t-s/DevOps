Problem Statement: Deploy a Basic Web Application Infrastructure on AWS

You are tasked with creating the infrastructure for a simple web application on AWS using Terraform. The infrastructure should consist of the following components:

- VPC (Virtual Private Cloud): A private network within AWS.
- Subnets: Two subnets within the VPC, one public and one private, spread across two Availability Zones.
- Internet Gateway: To allow the public subnet to access the internet.
- Route Tables: Route tables to control network traffic within the VPC.
- Security Groups: Security groups to control inbound and outbound traffic to your instances.
- EC2 Instance: An EC2 instance in the public subnet to host the web application.
- S3 Bucket: An S3 bucket to store static web application files (e.g., HTML, CSS, JavaScript).


Requirements:

- The solution should be modular, with separate modules for the VPC, subnets, security groups, and EC2 instance.
- Use input variables to make the solution configurable (e.g., instance type, AMI ID, region).
- Use output values to expose important information (e.g., the public IP address of the EC2 instance, the S3 bucket name).
- Store the Terraform state remotely in an S3 bucket.
- Implement best practices for security (e.g., use security groups to restrict access, don't hardcode credentials).
- The solution should be easily deployable and destroyable using Terraform commands.
Add descriptive comments to the code.
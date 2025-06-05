# AWS Web Application Infrastructure

This Terraform configuration creates a highly available web application infrastructure on AWS, following the Well-Architected Framework best practices for reliability and performance.

## Architecture Overview

The infrastructure consists of the following components:

- Application Load Balancer (ALB) in public subnets
- Auto Scaling Group (ASG) with EC2 instances in private subnets
- S3 bucket for static assets
- Security groups for ALB and EC2 instances
- Launch template for EC2 instances

## Directory Structure

```
terraform/
├── environments/
│   └── prod/
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       └── variables.tf
└── modules/
    ├── alb/
    ├── asg/
    ├── launch_template/
    ├── s3/
    └── security_groups/
```

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.2.0
- An existing VPC with:
  - CIDR block: 10.0.0.0/16
  - At least two public subnets
  - At least two private subnets
- An existing IAM role for EC2 instances

## Modules

### Security Groups (`modules/security_groups`)

Creates security groups for the ALB and EC2 instances:
- ALB Security Group: Allows HTTP (80) and HTTPS (443) from internet
- EC2 Security Group: Allows HTTP (80) from ALB

### Application Load Balancer (`modules/alb`)

Creates an ALB with:
- HTTP listener on port 80
- Target group with health checks
- Public subnet placement

### Launch Template (`modules/launch_template`)

Creates a launch template for EC2 instances with:
- Ubuntu 20.04 AMI
- t2.micro instance type
- User data script to install and configure Nginx
- IAM role attachment
- Security group configuration

### Auto Scaling Group (`modules/asg`)

Creates an ASG with:
- Minimum 2 instances
- Maximum 4 instances
- Desired capacity of 2 instances
- Health check grace period of 300 seconds
- Scale up and scale down policies

### S3 Bucket (`modules/s3`)

Creates an S3 bucket for static assets with:
- Versioning enabled
- Server-side encryption (AES256)
- Public access blocked
- Proper tagging

## Configuration

### Required Variables

Create a `terraform.tfvars` file in the `environments/prod` directory with the following variables:

```hcl
aws_region = "us-east-1"
environment = "prod"
project_name = "webapp"
vpc_id = "vpc-xxxxxx"
public_subnet_ids = ["subnet-xxxxxx", "subnet-yyyyyy"]
private_subnet_ids = ["subnet-aaaaaa", "subnet-bbbbbb"]
```

### Optional Variables

The following variables have default values but can be overridden:

```hcl
instance_type = "t2.micro"
ami_id = "ami-0c55b0a94c5895ff9"
min_size = 2
max_size = 4
desired_capacity = 2
instance_role_arn = "arn:aws:iam::123456789012:role/WebAppInstanceRole"
s3_bucket_name = "webapp-static-assets"
```

## State Management

The configuration uses an S3 backend for state management:
- State file is stored in an S3 bucket
- State file is encrypted at rest
- DynamoDB table is used for state locking

## Deployment

1. Initialize Terraform:
```bash
cd terraform/environments/prod
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

## Outputs

After successful deployment, the following outputs will be available:

- `alb_dns_name`: DNS name of the Application Load Balancer
- `alb_arn`: ARN of the Application Load Balancer
- `s3_bucket_name`: Name of the S3 bucket for static assets
- `asg_name`: Name of the Auto Scaling Group

## Best Practices Implemented

1. **Reliability**
   - Multi-AZ deployment
   - Auto scaling capabilities
   - Health checks
   - Graceful instance termination

2. **Security**
   - Private subnet placement for EC2 instances
   - Security groups with least privilege
   - Encrypted S3 bucket
   - Public access blocked for S3

3. **Performance**
   - Application Load Balancer
   - Auto scaling policies
   - Health check configurations

4. **Cost Optimization**
   - t2.micro instances
   - Proper resource sizing
   - Auto scaling to match demand

5. **Operational Excellence**
   - Modular design
   - Consistent naming convention
   - Resource tagging
   - State management

## Maintenance

### Scaling

The infrastructure automatically scales based on demand:
- Scale up: When CPU utilization increases
- Scale down: When CPU utilization decreases
- Cooldown period: 300 seconds between scaling actions

### Updates

To update the infrastructure:
1. Modify the desired configuration
2. Run `terraform plan` to review changes
3. Apply changes with `terraform apply`

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy
```

## Security Considerations

1. The EC2 instances are placed in private subnets
2. Security groups follow the principle of least privilege
3. S3 bucket has encryption enabled and public access blocked
4. IAM roles are used for EC2 instance permissions
5. State file is encrypted and stored securely

## Monitoring

The infrastructure includes:
- ALB health checks
- Auto scaling metrics
- CloudWatch alarms (can be added as needed)

## Support

For issues or questions, please create an issue in the repository. 
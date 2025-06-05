# AWS Web Application Infrastructure with Terragrunt

This configuration creates a highly available web application infrastructure on AWS using Terraform and Terragrunt, following the Well-Architected Framework best practices for reliability and performance. The infrastructure is designed to work with a new AWS account, creating all necessary resources from scratch.

## Architecture Overview

The infrastructure consists of the following components:

- VPC with public and private subnets across multiple AZs
- Application Load Balancer (ALB) in public subnets
- Auto Scaling Group (ASG) with EC2 instances in private subnets
- S3 bucket for static assets
- Security groups for ALB and EC2 instances
- Launch template for EC2 instances
- IAM roles and policies for EC2 instances

## Directory Structure

```
Terraform_Sample/
├── modules/
│   ├── alb/
│   ├── asg/
│   ├── iam/
│   ├── launch_template/
│   ├── s3/
│   ├── security_groups/
│   └── vpc/
└── terragrunt/
    ├── common_vars.yaml
    ├── terragrunt.hcl
    └── environments/
        ├── prod/
        │   ├── env_vars.yaml
        │   └── terragrunt.hcl
        └── dev/
            ├── env_vars.yaml
            └── terragrunt.hcl
```

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform >= 1.2.0
- Terragrunt >= 0.45.0
- AWS account with sufficient permissions to create all resources

## Configuration

### Common Variables (`common_vars.yaml`)

Common variables shared across all environments:
```yaml
aws_region: "us-east-1"
project_name: "webapp"
vpc_cidr: "10.0.0.0/16"
availability_zones:
  - "us-east-1a"
  - "us-east-1b"
instance_type: "t2.micro"
ami_id: "ami-0c55b0a94c5895ff9"
```

### Environment-Specific Variables

Production (`environments/prod/env_vars.yaml`):
```yaml
min_size: 2
max_size: 4
desired_capacity: 2
```

Development (`environments/dev/env_vars.yaml`):
```yaml
min_size: 1
max_size: 2
desired_capacity: 1
```

## Deployment

1. Initialize Terragrunt:
```bash
cd Terraform_Sample/terragrunt/environments/prod
terragrunt init
```

2. Review the planned changes:
```bash
terragrunt plan
```

3. Apply the configuration:
```bash
terragrunt apply
```

## Resource Creation Order

The infrastructure will be created in the following order:
1. VPC and networking components
2. IAM roles and policies
3. Security groups
4. S3 bucket
5. ALB
6. Launch template
7. Auto Scaling Group

## State Management

Terragrunt is configured to use S3 for remote state storage:
- State files are stored in an S3 bucket named `{project_name}-terraform-state`
- State files are encrypted at rest
- DynamoDB table `{project_name}-terraform-locks` is used for state locking

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
   - IAM roles with minimal required permissions

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
   - DRY configuration with Terragrunt
   - Environment-specific configurations

## Maintenance

### Scaling

The infrastructure automatically scales based on demand:
- Scale up: When CPU utilization increases
- Scale down: When CPU utilization decreases
- Cooldown period: 300 seconds between scaling actions

### Updates

To update the infrastructure:
1. Modify the desired configuration
2. Run `terragrunt plan` to review changes
3. Apply changes with `terragrunt apply`

## Cleanup

To destroy the infrastructure:
```bash
terragrunt destroy
```

## Security Considerations

1. The EC2 instances are placed in private subnets
2. Security groups follow the principle of least privilege
3. S3 bucket has encryption enabled and public access blocked
4. IAM roles are used for EC2 instance permissions with minimal required permissions
5. NAT Gateway is used for outbound internet access from private subnets
6. State files are encrypted and stored securely in S3

## Monitoring

The infrastructure includes:
- ALB health checks
- Auto scaling metrics
- CloudWatch alarms (can be added as needed)

## Support

For issues or questions, please create an issue in the repository. 
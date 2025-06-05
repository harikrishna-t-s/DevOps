module "security_groups" {
  source = "../../modules/security_groups"

  project_name = var.project_name
  vpc_id       = var.vpc_id
}

module "alb" {
  source = "../../modules/alb"

  project_name       = var.project_name
  vpc_id            = var.vpc_id
  security_group_id = module.security_groups.alb_security_group_id
  public_subnet_ids = var.public_subnet_ids
}

module "launch_template" {
  source = "../../modules/launch_template"

  project_name       = var.project_name
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  security_group_id = module.security_groups.ec2_security_group_id
  instance_role_arn = var.instance_role_arn
}

module "asg" {
  source = "../../modules/asg"

  project_name            = var.project_name
  desired_capacity       = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
  target_group_arn      = module.alb.target_group_arn
  private_subnet_ids    = var.private_subnet_ids
  launch_template_id    = module.launch_template.launch_template_id
  launch_template_version = module.launch_template.launch_template_latest_version
}

module "s3" {
  source = "../../modules/s3"

  project_name = var.project_name
  bucket_name  = var.s3_bucket_name
} 
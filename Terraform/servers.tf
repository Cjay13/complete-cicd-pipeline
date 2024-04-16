module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "controlplane"

  ami = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Project = "cicd-complete"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "worker-one"
  
  ami = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 0)

  tags = {
    Project = "cicd-complete"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "worker-two"
  
  ami = data.aws_ami.ubuntu.id
  instance_type          = "t3.medium"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.private_subnets, 1)

  tags = {
    Project = "cicd-complete"
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jump-host"
  
  ami = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = "web-dev-key"
  monitoring             = true
  vpc_security_group_ids = [module.k8s_cluster_sg.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)

  tags = {
    Project = "cicd-complete"
  }
}
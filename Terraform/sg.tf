module "k8s_cluster_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "k8s-cluster-sg"
  description = "Security group for Kubernetes cluster"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      rule        = "kubernetes-api-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 10250
      to_port     = 10250
      protocol    = "tcp"
      description = "kubelet"
      cidr_blocks = element(module.vpc.private_subnets_cidr_blocks, 0)
    },
    {
      from_port   = 10250
      to_port     = 10250
      protocol    = "tcp"
      description = "kubelet"
      cidr_blocks = element(module.vpc.private_subnets_cidr_blocks, 1)
    },
    {
      rule        = "smtp-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "smtps-465-tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = element(module.vpc.public_subnets_cidr_blocks, 0)
    },
    {
      rule        = "ssh-tcp"
      cidr_blocks = element(module.vpc.public_subnets_cidr_blocks, 1)
    },
    {
      from_port   = 30000
      to_port     = 32767
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }

  ]

}

module "jumphost-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "jumphost-sg"
  description = "Security Group for the jump host"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
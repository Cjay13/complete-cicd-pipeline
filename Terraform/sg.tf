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
      cidr_blocks = [module.vpc.private_subnets_cidr_blocks]
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
      cidr_blocks = module.vpc.public_subnets_cidr_blocks
    },
    {
      from_port   = 30000
      to_port     = 32767
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    {

  ]
  
}
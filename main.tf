module "eks_cluster_feb26" {
  source = "git::https://github.com/aumthakkar/eks-feb26.git"

  aws_region            = "eu-north-1"
  vpc_cidr              = "10.0.0.0/16"
  name_prefix           = "pht-dev"
  public_subnets_count  = 2
  private_subnets_count = 2

  autocreate_public_cidr_block  = true
  autocreate_private_cidr_block = true
  manual_public_cidr_block      = ["10.0.30.0/24", "10.0.32.0/24"]
  manual_private_cidr_block     = ["10.0.33.0/24", "10.0.35.0/24"]

  eks_version  = "1.32"
  cluster_name = "pht-dev-eks-cluster"

  public_acccess_cidrs = ["0.0.0.0/0"]

  service_ipv4_cidr = "172.20.0.0/16"

  nodegroup_keyname = "mtckey"
  node_group_name   = "pht-dev-eks-nodegroup"

  nodegroup_ami_type       = "AL2_x86_64"
  nodegroup_instance_types = ["t3.medium"]
  nodegroup_capacity_type  = "SPOT"
  nodegroup_disk_size      = 20

  ec2_ssh_key = "mtckey"

  nodegroup_desired_size = 1
  nodegroup_min_size     = 1
  nodegroup_max_size     = 1

  max_unavailable_percentage = 50

  create_ebs_controller = false
  create_lbc_controller = false
  create_cloudwatch_controller = true

}
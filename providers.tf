provider "aws" {
  region = "eu-north-1"
}

data "aws_eks_cluster_auth" "my_eks_cluster_auth" {
  name = module.eks_cluster_feb26.cluster_name
}

# provider "kubernetes" {
#   host                   = module.eks_cluster_jan26.cluster_endpoint

#   cluster_ca_certificate = base64decode(module.eks_cluster_jan26.cluster_certificate_authority)
#   token                  = data.aws_eks_cluster_auth.my_eks_cluster_auth.token
# }

provider "helm" {
  kubernetes = {
    host                   = module.eks_cluster_feb26.cluster_endpoint

    cluster_ca_certificate = base64decode(module.eks_cluster_feb26.cluster_certificate_authority)
    token                  = data.aws_eks_cluster_auth.my_eks_cluster_auth.token
  }
}

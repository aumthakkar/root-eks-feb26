output "cluster_name" {
  value = module.eks_cluster_feb26.cluster_name
}

output "cluster_endpoint" {
  value = module.eks_cluster_feb26.cluster_endpoint
}

output "cluster_certificate_authority" {
  value = module.eks_cluster_feb26.cluster_certificate_authority
}

output "eks_cluster_version" {
  value = module.eks_cluster_feb26.eks_cluster_version
}


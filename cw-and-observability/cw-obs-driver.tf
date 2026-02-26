data "aws_eks_addon_version" "cw_latest_addon_version" {
  addon_name = "amazon-cloudwatch-observability"

  kubernetes_version = data.terraform_remote_state.eks.outputs.eks_cluster_version
  most_recent        = true
}

resource "aws_eks_addon" "cw_obs_driver" {
  cluster_name = data.terraform_remote_state.eks.outputs.cluster_name

  addon_name    = "amazon-cloudwatch-observability"
  addon_version = data.aws_eks_addon_version.cw_latest_addon_version.version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  configuration_values = null
  preserve             = false

  depends_on = [
    aws_eks_pod_identity_association.cw_obs_pod_identity_association
  ]

}
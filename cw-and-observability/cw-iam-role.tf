resource "aws_iam_role" "cw_obs_iam_role" {
  name = "pht-dev-cw-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "pods.eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "pht-dev-cw-iam-role"
  }
}

resource "aws_iam_role_policy_attachment" "cw_role_policy_attachment" {
  role       = aws_iam_role.cw_obs_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "cw_role_xray_policy_attachment" {
  role       = aws_iam_role.cw_obs_iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
}

resource "aws_eks_pod_identity_association" "cw_obs_pod_identity_association" {
  cluster_name = data.terraform_remote_state.eks.outputs.cluster_name
  namespace    = "amazon-cloudwatch"

  role_arn        = aws_iam_role.cw_obs_iam_role.arn
  service_account = "cloudwatch-agent"

}
output "kubernetes_oidc_provider_arn" {
    value = aws_iam_openid_connect_provider.kubernetes.arn
}

output "kubernetes_oidc_provider_url" {
    value = local.eks_oidc_url
}

output "eks_cluster_name" {
    value = aws_eks_cluster.this.name
}
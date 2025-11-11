locals {
    eks_oidc_arn = data.terraform_remote_state.outputs.kubernetes_oidc_provider_arn
    eks_oidc_url = data.terraform_remote_state.outputs.kubernetes_oidc_provider_url
    eks_cluster_name = data.terraform_remote_state.outputs.eks_cluster_name
    account_id = data.aws_caller_identity.current.account_id
}
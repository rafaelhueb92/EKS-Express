locals {
    karpenter_node_role_name               = data.terraform_remote_state.outputs.karpenter_node_role_name
    eks_cluster_node_group_name            = data.terraform_remote_state.outputs.eks_cluster_node_group_name
    eks_cluster_certificate_authority_data = data.terraform_remote_state.outputs.eks_cluster_certificate_authority_data
    eks_cluster_endpoint                   = data.terraform_remote_state.outputs.eks_cluster_endpoint
    eks_cluster_security_group             = data.terraform_remote_state.outputs.eks_cluster_security_group
    eks_oidc_arn                           = data.terraform_remote_state.outputs.kubernetes_oidc_provider_arn
    eks_oidc_url                           = data.terraform_remote_state.outputs.kubernetes_oidc_provider_url
    eks_cluster_name                       = data.terraform_remote_state.outputs.eks_cluster_name
    account_id                             = data.aws_caller_identity.current.account_id
}
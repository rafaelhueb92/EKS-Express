locals {
    eks_cluster_arn                        = data.terraform_remote_state.outputs.eks_cluster_arn
    eks_cluster_name                       = data.terraform_remote_state.outputs.eks_cluster_name
    eks_cluster_security_group             = data.terraform_remote_state.outputs.eks_cluster_security_group
    account_id                             = data.aws_caller_identity.current.account_id
}
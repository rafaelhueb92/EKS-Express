locals {
    eks_cluster_name                       = data.terraform_remote_state.outputs.eks_cluster_name
    account_id                             = data.aws_caller_identity.current.account_id
}
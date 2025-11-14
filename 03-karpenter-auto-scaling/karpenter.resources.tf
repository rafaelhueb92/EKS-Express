resource "terraform_data" "karpenter_resources" {
    provisioner "local-exec" {
        command = "${path.module}/cli/karpenter-crds-create.sh"
        when = create
        ENVIRONMENT = {
            REGION = var.region
            CLUSTER_NAME = local.eks_cluster_name
            KARPENTER_NODE_ROLE = local.karpenter_node_role_name
        }
    }

    depends_on = [ helm_release.karpenter]

}
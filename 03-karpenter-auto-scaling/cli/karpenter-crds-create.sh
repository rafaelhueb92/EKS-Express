#! /bin/bash

KARPENTER_VERSION="1.5.0"

function eneableKubernetesClusterConnection(){
    aws eks --region $REGION update-kubeconfig --name $CLUSTER_NAME
}

function installKarpenterCustomResourceDefinitions(){
    kubectl create -f \
    "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v${$KARPENTER_VERSION}/pkg/apis/crds/karpenter.sh_nodepools.yaml"
    kubectl create -f \
    "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v${$KARPENTER_VERSION}/pkg/apis/crds/karpenter.k8s.aws_ec2nodeclasses.yaml"
    kubectl create -f \
    "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v${$KARPENTER_VERSION}/pkg/apis/crds/karpenter.sh_nodeclaims.yaml"
}

eneableKubernetesClusterConnection

installKarpenterCustomResourceDefinitions
#! /bin/bash

KARPENTER_VERSION="1.5.0"

function eneableKubernetesClusterConnection(){
    aws eks --region $REGION update-kubeconfig --name $CLUSTER_NAME
}

function replaceKarpenterPlaceHolders(){
    sed -i "s|\${CLUSTER_NAME}|$CLUSTER_NAME|g" ./resources/karpenter-node-class.yml
    sed -i "s|\${KARPENTER_NODE_ROLE}|$KARPENTER_NODE_ROLE|g" ./resources/karpenter-node-class.yml
}

function createKarpenterResources(){
    kubectl apply -f ./resources/karpenter-node-class.yml
    kubectl apply -f ./resources/karpenter-node-pool.yml
}

eneableKubernetesClusterConnection

replaceKarpenterPlaceHolders

createKarpenterResources
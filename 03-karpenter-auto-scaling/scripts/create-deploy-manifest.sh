mkdir -p samples
kubectl create deploy nginx --image nginx --replicas 5 --dry-run=client -o yaml > ./samples/karpenter-nginx-deployment.yml
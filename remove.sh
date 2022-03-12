echo "Deleting All...";echo;

cd kubernetes/deployments
kubectl delete -f .
helm delete postgres
helm delete ingress-nginx
kubectl delete all --all  -n ingress-nginx
echo "Deleting All...";echo;


helm uninstall ingress-nginx
helm uninstall myapp
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
kubectl delete all --all -n ingress-nginx
kubectl delete ingressclass nginx --all-namespaces
kubectl delete cm ingress-nginx-nginx-ingress-leader-election
kubectl delete namespace ingress-nginx
kubectl delete crd --all
kubectl delete clusterrole nginx-ingress
kubectl delete clusterrolebinding nginx-ingress
kubectl delete crd --all
kubectl delete clusterrole nginx-ingress
kubectl delete clusterrolebinding nginx-ingress
kubectl delete -f nginx-ingress.yaml
helm delete postgres
helm delete ingress-nginx
kubectl delete ingressclass ingress --all-namespaces
kubectl delete all --all  -n ingress-nginx
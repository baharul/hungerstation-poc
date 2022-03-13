echo "Deleting All...";echo;

kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
kubectl delete all --all -n ingress-nginx

kubectl delete ingress  ingress-flaskapp -n default
kubectl delete ingressclass nginx --all-namespaces
kubectl delete cm ingress-nginx-nginx-ingress-leader-election
kubectl delete namespace ingress-nginx

kubectl delete crd --all
kubectl delete clusterrole nginx-ingress
kubectl delete clusterrolebinding nginx-ingress

kubectl delete ingressclass ingress --all-namespaces
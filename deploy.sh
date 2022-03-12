#! /bin/bash
echo;
echo "########### Creating the Persistent volume & Claim for PostresDB... ###########";echo;
echo;
cd kubernetes/deployments
kubectl apply -f 02-postgresql-pv-pvc.yaml;echo;
echo;
echo "########### Installing the bitnami/postresql Helm Chart... ########### ";echo;
echo;
helm repo add bitnami https://charts.bitnami.com/bitnami; helm update;
helm install postgres bitnami/postgresql --set persistence.existingClaim=postgresql-pvc --set volumePermissions.enabled=true --set global.postgresql.auth.database="firstdb"  --set global.postgresql.auth.username="firstuser" --set global.postgresql.auth.password="pleasechangeme";echo;
echo;
echo "########### Installing Flask app ###########";echo;
echo;
kubectl apply -f secrets.yaml
kubectl apply -f 01-app-deployment.yaml; echo;
echo;
echo "########### Installing the Nginx/stable Helm Chart... ###########"
echo;
helm repo add nginx-stable https://helm.nginx.com/stable; helm update;
helm install ingress-nginx nginx-stable/nginx-ingress

echo;
echo "########### Creating a Service with Nodeport to allow access to Ingress Controller ###########"
echo;
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/baremetal/deploy.yaml
echo;
echo "########### service mapping through an ingress controller using the type Ingress ###########"
echo;
kubectl apply -f nginx-ingress.yaml

sleep 10
echo;
echo "Checking Health Check - http://localhost/healthz - Please check after 10 seconds"
echo;
echo "Hit the below Urls in Postman or any API Client with this url to work with Postgres DB "
echo;
echo " To Create New records in DB http://localhost/items ==> data { "title": "sample title 1", "content": "sample content 2"}"
echo;
echo "To Fetch all records in DB http://localhost/items"
echo;
echo "To Fetch single record in DB http://localhost/items/<id>"














# echo "Deleting All...";echo;

# kubectl delete -f 02-postgresql-pv-pvc.yaml
# helm uninstall postgres
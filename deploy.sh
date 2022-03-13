#! /bin/bash
echo;
echo "########### Installing the Helm Chart Of Flask-Api... ###########";echo;
echo;
helm install dev-deploy-hs -f ./flask-api/values-dev.yaml ./flask-api/
# cd kubernetes/deployments
# kubectl apply -f 02-postgresql-pv-pvc.yaml;echo;
echo;
echo "########### Installing the bitnami/postresql Helm Chart... ########### ";echo;
echo;
helm repo add bitnami https://charts.bitnami.com/bitnami; helm update;
helm install postgres bitnami/postgresql --set persistence.existingClaim=postgresql-pvc --set volumePermissions.enabled=true --set global.postgresql.auth.database="firstdb"  --set global.postgresql.auth.username="firstuser" --set global.postgresql.auth.password="pleasechangeme";echo;
sleep 10
echo; 
echo "########### Installing the Nginx/stable Helm Chart... ###########"
echo;
helm repo add nginx-stable https://helm.nginx.com/stable; helm update;
helm install ingress-nginx nginx-stable/nginx-ingress
sleep 20

echo;
echo "########### Creating a Service with Nodeport to allow access to Ingress Controller ###########"
echo;
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/baremetal/deploy.yaml
sleep 20
echo;
echo "########### service mapping through an ingress controller using the type Ingress ###########"
echo;
# kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
echo;
cd kubernetes/deployments
kubectl apply -f nginx-ingress.yaml
sleep 20
echo;
echo "Checking Health Check - http://localhost/healthz - Please check after 10 seconds"
i=0;while [ $i -le 10 ];do curl  http://localhost/healthz;((i++)); done
echo;
echo "Hit the BELOW URLS in Postman or any API Client with this url to work with Postgres DB "
echo;
echo " POST CALL - To Create New records in DB http://localhost/items ==> data { "title": "sample title 1", "content": "sample content 2"}"
echo;
echo "GET CALL - To Fetch all records in DB http://localhost/items"
echo;
echo "POST CALL - To Fetch single record in DB http://localhost/items/<id>"














# echo "Deleting All...";echo;

# kubectl delete -f 02-postgresql-pv-pvc.yaml
# helm uninstall postgres
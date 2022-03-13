
STR=$(kubectl get ns)
SUB='ingress-nginx'
if [[ "$STR" == *"$SUB"* ]]; then
  echo "########### Removing Existing Nginx Ingress dependencies for clean installation... ###########"
  echo;
  echo "Namespase nginx-ingress exists in k8s cluster, Removing it...."
  sh ./remove.sh
fi


echo;

echo "########### Starting Deployment... ###########"
echo;

echo "########### Solving Helm Dependencies ###########"
echo;
cd flask-api-chart/
helm dep update
helm dep build
cd ..

echo; 
echo "########### Installing the Flask App myapp Helm Chart... ###########"
echo;
helm upgrade --install myapp -f values-dev.yaml -f db-secrets.yaml flask-api-chart
echo; 

echo "########### Installing the Nginx/stable Helm Chart... ###########"
echo;
helm repo add nginx-stable https://helm.nginx.com/stable;
helm upgrade --install ingress-nginx nginx-stable/nginx-ingress
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
kubectl apply -f nginx-ingress.yaml
sleep 20
echo;

echo "########### Checking Health Check of the Application - Check after 15 secs ###########"
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


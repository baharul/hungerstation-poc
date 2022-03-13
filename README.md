# hungerstation-poc
This app demonstrates how we can create and deploy a simple Python Flask Api with CRUD operation in postgresql DB and deploy it in single node cluster using Docker for Kubernetes.

# Pre-requisites:


This app is tested thoroughly only on MacOS Bigsur and in Docker for kubernetes platform. Please make sure you have the below softwares installed.

  1. Python > 3.7+
  2. Docker - Enable Kubernetes
  3. Git
  4. Postman Api Client

# Git
         git clone https://github.com/baharul/hungerstation-poc.git
         
# Running Scripts

      1. Enable execution permission for the files - chmod +x deployment.sh  && chmod +x remove.sh
      
      2. In Your terminal, Enter sh deploy.sh to trigger the deployment.
      
      3. To be on safer side, Please keep the localhost and port 80 free for deploying the ingress object as we use it as host for our backend service.
      
      
# Screenshots

Shell Script Output Screen - 1 - Installing Application Helm Chart and provisioning DB with PV and PVC

![image](https://user-images.githubusercontent.com/7221247/158053288-005823b9-8827-4210-acab-2714ab6c0423.png)

Shell Script Output Screen - 2 - Service with Nodeport to allow access to Ingress Controller and Service Health Check

![image](https://user-images.githubusercontent.com/7221247/158053303-ffbee418-7dc1-4a8d-8aeb-f232bbbe12d8.png)

Shell Output for the Command - kubectl get all --all-namespaces

![image](https://user-images.githubusercontent.com/7221247/158053419-1539f653-4a10-4ba8-ac8c-868a1a0c3585.png)

App Screenshot 1:

![image](https://user-images.githubusercontent.com/7221247/158053457-7943a5ea-87d1-4800-a170-ee25b5bd152a.png)

App Screenshot 2:

<img width="1585" alt="image" src="https://user-images.githubusercontent.com/7221247/158053501-0d913da3-beb8-430c-8eff-e28d5d58af4b.png">

App Screenshot 3:

<img width="1585" alt="image" src="https://user-images.githubusercontent.com/7221247/158053538-8d0fd69d-ff65-4cd2-9a67-f6bbe7b1e975.png">


      

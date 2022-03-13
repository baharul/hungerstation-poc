# hungerstation-poc
This app demonstrates how we can create and deploy a simple Python Flask Api with CRUD operation in postgresql DB and deploy it in single node cluster using Docker for Kubernetes.

# Pre-requisites:


Please make sure you have the below softwares installed. This app has been tested in Docker for kubernetes - Single Node Cluster

  1. Python > 3.7+
  2. Docker - Enable Kubernetes
  3. Git
  4. Postman Api Client
  5. Helm Latest version
  6. Kubectl Latest version

# Compile Docker compose Locally:

      1. docker-compose build - Build the project.
      
      2. docker-compose up db - Execute this command first as we need to bring the DB first before app.

      3. docker-compose up - Execute this command to bring up the Flask App.

      4. docker-compose down - Execute this command to bring down the service.
    


# Git
         git clone https://github.com/baharul/hungerstation-poc.git
         
# Running Scripts

      1. Enable execution permission for the files - chmod +x deployment.sh  && chmod +x remove.sh
      
      2. In Your terminal, Enter sh deploy.sh to trigger the deployment.
      
      3. To be on safer side, Please keep the localhost and port 80 free for deploying the ingress object as we use it as host for our backend service.
      
      
# Screenshots

Shell Script Output Screen - 1

<img width="1590" alt="image" src="https://user-images.githubusercontent.com/7221247/158076107-aa551369-7d3a-41fe-94b9-47585e2d851f.png">

Shell Script Output Screen - 2

<img width="1590" alt="image" src="https://user-images.githubusercontent.com/7221247/158076127-cc86ed47-50a8-4ee8-a279-5280db9f664c.png">
<img width="1590" alt="image" src="https://user-images.githubusercontent.com/7221247/158076134-081ad527-9028-4d0d-a3bd-8e18a880f76b.png">


Shell Output for the Command - kubectl get all --all-namespaces

<img width="1590" alt="image" src="https://user-images.githubusercontent.com/7221247/158076149-b548c3cd-cc17-4e93-810c-99045757a11f.png">

App Screenshot 1:

<img width="1411" alt="image" src="https://user-images.githubusercontent.com/7221247/158076172-9a780c4f-f010-4288-a295-922aeb95d09f.png">

App Screenshot 2:

<img width="1411" alt="image" src="https://user-images.githubusercontent.com/7221247/158076177-fea45591-2ecf-4c03-8815-21160db4f131.png">

App Screenshot 3:

<img width="1411" alt="image" src="https://user-images.githubusercontent.com/7221247/158076191-da953e9c-24ca-4218-9e83-987e2f832f1b.png">


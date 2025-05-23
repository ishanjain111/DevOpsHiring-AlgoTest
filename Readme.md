Hi,

1) For the first task:

I have written a Dockerfile that:
Installs dependencies from requirements.txt
Runs the app on port 5000

Command to Build Image: docker build -t flask-app .
Command to Run the Container: docker run -d -p 5000:5001 flask-app

2) For the task 2 I have written the yaml file that auto-reload whenever code changes. For that we have to enable the debug mode, and mount the volume to working dir to copy the changes.

Command to run: docker compose -f flask-app-composer.yml up -d

3) Created a cluster and container registry on DigitalOcean using terraform. K8s Version used '1.32.2-do.1' in bengalore region with single node. Connection from local machine is also verified. 

4) In the task 4 we have pushed our image on digitalocean's container regisrty. Created a deployment with one replica and used loadbalancer service to expose the flask app. External Ip: 139.59.50.35, Nodeport: 30506

5) I have written a basic JenkinsFile that does the deployment. But here are some ambiguties like connection to scm for continous integration and this pipeline is suited for second deployment this will not create service and we have to add stages according to Addind a service or building it. 
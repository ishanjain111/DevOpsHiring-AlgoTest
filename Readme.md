Hi,

For the first task:

I have written a Dockerfile that:
Installs dependencies from requirements.txt
Runs the app on port 5000

Command to Build Image: docker build -t flask-app .
Command to Run the Container: docker run -d -p 5000:5001 flask-app

2) For the task 2 I have written the yaml file that auto-reload whenever code changes. For that we have to enable the debug mode, and mount the volume to working dir to copy the changes.
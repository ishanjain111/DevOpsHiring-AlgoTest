#base_image
FROM python:3.11-alpine

#Setting Up Working Directory
WORKDIR /app

#Copying Requirement.txt
COPY requirements.txt .

#Installing Requirement.txt
RUN pip install -r requirements.txt

#Copying Rest of the code
COPY app.py .

#Exposing Container
EXPOSE 5001

#Running the flask app
CMD ["python", "app.py"]
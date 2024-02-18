# base image
FROM python:3.9-slim-buster AS build
# setup environment variable  
ENV DockerHOME=/app  

# set work directory  
RUN mkdir -p $DockerHOME  

# where your code lives  
WORKDIR $DockerHOME  

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1  

# run this command to install all dependencies  
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy whole project to your docker home directory. 
COPY ./cars-app $DockerHOME
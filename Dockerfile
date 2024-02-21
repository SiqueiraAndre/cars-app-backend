# base image
FROM python:3.8

# set environment variables
ENV APP_HOME=/app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR $APP_HOME

# update pip, install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt $APP_HOME
RUN pip install -r requirements.txt

# copy app folder
COPY ./cars-app $APP_HOME

COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]

# pull official base image
FROM python:3.7.6-alpine

RUN mkdir /config
RUN ls 

# set work directory
# WORKDIR /config

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# WORKDIR .

# install dependencies
COPY ./requirements /config/
# RUN ls ./config/
RUN apk update \
  && apk add --virtual build-deps gcc python3-dev musl-dev \
  && apk add postgresql-dev \
  && pip install psycopg2 \
  && apk del build-deps
RUN pip install -r /config/base.txt

RUN mkdir /app

COPY ./app/ /app/
# RUN ls ./app/

FROM ubuntu:20.04
FROM debian:latest
#! /bin/bash

COPY requirements.txt /tmp/requirements.txt

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-venv
RUN apt-get install -y unzip

RUN  pip install -r /tmp/requirements.txt


RUN wget -P ~/Downloads/ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN apt-get install -y ~/Downloads/google-chrome-stable_current_amd64.deb


#RUN wget -P ~/Downloads/ https://chromedriver.storage.googleapis.com/98.0.4758.80/chromedriver_linux64.zip

#ADD ~/Downloads/chromedriver_linux64.zip /opt/
#RUN unzip /opt/chromedriver_linux64.zip

#RUN chmod +x /opt/chromedriver/chromedriver

ENV CHROMEDRIVER_VERSION 98.0.4758.80
ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

RUN ln -fs $CHROMEDRIVER_DIR /usr/local/bin/chromedriver

ENTRYPOINT ["./docker_run_jenkins.sh"]


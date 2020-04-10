# Dockerfile for clamav service
FROM ubuntu:latest

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/dds_lib
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/clamav_lib

# python3 shared with most images
RUN apt-get update && apt-get install -y \
    python3.6 python3-pip \
  && pip3 install --upgrade pip
# Image specific layers under this line
RUN mkdir -p /logs /data
RUN echo `date`: File created >> /logs/clamscan.log
#RUN chmod +r /etc/fcron/*

RUN apt-get install -y clamav rsyslog

COPY . /app
RUN chmod +x /app/health.sh /app/scan.sh

WORKDIR /app
CMD ./start.py

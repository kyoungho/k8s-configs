# Dockerfile for ClamAV
FROM ubuntu:latest

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/dds_lib
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/clamav_lib

RUN apt-get update && apt-get install -y \
    clamav rsyslog
RUN mkdir -p /logs /data
RUN echo `date`: File created >> /logs/clamscan.log

COPY . /app

WORKDIR /app
CMD ./start.sh

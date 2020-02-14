FROM ubuntu:18.04
MAINTAINER Marian Neagul <marian@info.uvt.ro>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update --fix-missing && apt-get -y dist-upgrade
RUN apt-get -y install software-properties-common && \
	/usr/bin/add-apt-repository ppa:ubuntugis/ppa && \
	apt-get -y update
RUN apt-get -y install wget gdal-bin
COPY . /opt/
ENTRYPOINT /opt/entrypoint.sh
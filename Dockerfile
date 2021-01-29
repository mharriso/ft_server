# base image
FROM debian:buster

RUN		apt-get update && apt-get -y upgrade

RUN		apt-get -y install nginx &&\
		apt-get -y install mariadb-server

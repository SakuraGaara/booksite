FROM centos:7.4
LABEL version="1.0"
MAINTAINER "SakuraGaara"

WORKDIR /data

RUN yum -y install epel-release && \
    yum -y install python36

ADD app
ADD manage.py
ADD requirements.txt

RUN pip install -r requirements.txt

ENTRYPOINT ["python","manage.py","runserver"]

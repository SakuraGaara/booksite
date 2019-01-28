FROM centos:7
LABEL version="1.0"
MAINTAINER "SakuraGaara"

WORKDIR /data


RUN yum -y install epel-release && \
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y install openssl-devel bzip2-devel expat-devel gdbm-devel readline-devel sqlite-devel && \
    yum -y install python36u python36u-pip && \
    ln -s /bin/python3.6 /bin/python3 && \
    ln -s /bin/pip3.6 /bin/pip3

ADD app ./app
ADD manage.py .
ADD requirements.txt .

RUN pip3 install -r requirements.txt

RUN echo "127.0.0.1 localhost" >> /etc/hosts

EXPOSE 5000

ENTRYPOINT ["python3","manage.py","runserver","-h","0.0.0.0"]

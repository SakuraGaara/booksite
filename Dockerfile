FROM python:3.6-alpine
LABEL version="1.0"
MAINTAINER "SakuraGaara"

WORKDIR /data

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk add --no-cache gcc musl-dev libxslt-dev \
    jpeg-dev zlib-dev freetype-dev tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone


ADD app ./app
ADD manage.py .
ADD requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python","manage.py","runserver","-h","0.0.0.0"]

FROM python:3.6-alpine
LABEL version="1.0"
MAINTAINER "SakuraGaara"

WORKDIR /data

RUN apk add --no-cache gcc musl-dev libxslt-dev \
    jpeg-dev zlib-dev freetype-dev


ADD app ./app
ADD manage.py .
ADD requirements.txt .

RUN pip install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python","manage.py","runserver","-h","0.0.0.0"]

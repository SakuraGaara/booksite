# booksite

基于flask开发类似gitbook的知识管理网站。

python版本要求: python3.6+

## 安装使用

#### 1. 安装mysql

booksite使用的数据库是mysql，安装前需要先安装mysql

我使用的是centos，安装方法可以参考该文档：[Installing MySQL on Linux Using the MySQL Yum Repository](https://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html)

#### 2. 安装依赖包

```
pip install -r requirements.txt
```

#### 3. 启动程序

```
python manage.py runserver -h 0.0.0.0
```

#### 4. 配置站点
在浏览器中输入http://127.0.0.1:5000


第一次访问会跳转到配置界面，根据指示配置站点信息后就能使用booksite



# Docker 安装使用
#### 使用Docker运行
- Dockerfile使用python:3.6-alpine镜像
- 首先解决lxml和Pillow的依赖问题
```
RUN apk add --no-cache gcc musl-dev libxslt-dev \
    jpeg-dev zlib-dev freetype-dev
```

```
docker run -d -p 5000:5000 --name booksite sakuragaara/booksite
```

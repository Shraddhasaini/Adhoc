# :fish: [Assignment 3](https://www.youtube.com/watch?v=HzGLd6q9AH0)

## :one: TASK #1:
> To Dockerize a Django signup page with database

### Creating a Django sign-up application:
```shell
$ mkdir django_signup
$ cd django_signup

```
>>>>>>>>>>>[Create a sample Django-signup page](https://github.com/Shraddhasaini/Django_Adhoc)

#### :cyclone: Prerequisites
* Installed Docker

* Installed docker-compose

* Your Django application code

#### :cyclone: Desired Specs
* Python 3.6

* MySQL 5.7 (or 5.X)

* docker compose version 3

#### :snowflake: Dockerfile
```text
FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /my_app_dir
WORKDIR /my_app_dir
ADD requirements.txt /my_app_dir/
RUN pip install -r requirements.txt
ADD . /my_app_dir/
```
#### :snowflake: docker-compose.yml
```yaml
version: '3'

services:
  db:
    image: mysql:5.7
    ports:
      - '3306:3306'
    environment:
       MYSQL_DATABASE: 'my-app-db'
       MYSQL_USER: 'root'
       MYSQL_PASSWORD: 'password'
       MYSQL_ROOT_PASSWORD: 'password'
  web:
    build: .
    command: python manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/my_app_dir
    ports:
      - "8000:8000"
    depends_on:
      - db
```

#### :snowflake: requirements.txt
```
appdirs==1.4.0
Django==1.10.5
packaging==16.8
pyparsing==2.1.10
six==1.10.0
mysqlclient==1.3.12
django-mysql==2.2.0
```
#### :snowflake: /settings.py
```python
...
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'my-app-db',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'db',
        'PORT': 3306,
    }
}
...
```
#### :fire: Fire it up and Migrate the database:
```shell
$ docker-compose build
$ docker-compose up -d
$ docker-compose run web python manage.py migrate
```
----------------------
## :two: TASK #2: 
>To Build A Docker Container That Executes Parent DE As The Container DE

#### :snowflake: Dockerfile
```text
FROM ubuntu
MAINTAINER shraddhasaini99@gmail.com
RUN apt-get update && apt-get install apt-transport-https ca-certificates  curl  gnupg-agent  software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install docker-ce docker-ce-cli -y
```

#### :snowflake: docker-compose.yml
```yaml
version: '3.8'
services:
 tasktwo:
  build: .
  tty: true
  image: tasktwo
  container_name: tasktwoc1
  volumes:
   - /var/run/docker.sock:/var/run/docker.sock
  network_mode: host
```
#### :fire: Fire it up and Migrate the database:
```shell
$ docker-compose up --build -d
$ docker-compose exec tasktwo bash
$ docker images
$ docker ps -a
```
----------------------------------

## :three: TASK #3:
> Automatically Update The Container Whenever The Image Update Occurs

```shell
$ sudo su
$ mkdir taskthree && cd taskthree
$ git clone https://github.com/microsoft/project-html-website.git
$ mv project-html-website webapp
$ atom Dockerfile
```
#### :snowflake: Dockerfile
```text
FROM httpd
MAINTAINER shraddhasaini99@gmail.com
COPY ./web/ /usr/local/apache2/htdocs/
```
#### :snowflake: Shell
```shell
$ docker build -t shraddhasaini/taskthree .
$ docker login
$ docker push shraddhasaini/taskthree
$ docker run -itd --name autocont --network host shraddhasaini/taskthree
```
```shell
$ docker run -d --name watchtower -v /var/run/docker.sock:/var/run/docker.sock v2tec/watchtower autocont
$ cd webapp
$ sed -i 's/Success/Failed/g' index.html
$ cd ..
$ docker build -t shraddhasaini/taskthree .
$ docker push shraddhasaini/taskthree
$ docker logs watchtower
```
----------------------------------------------
## :four: TASK #4:
>To Run Root Commands By A Non-Root User In A Docker Container

#### :snowflake: Dockerfile
```text
FROM ubuntu
MAINTAINER shraddhasaini99@gmail.com
RUN apt-get install sudo
RUN adduser --disabled-password --gecos '' shraddha
RUN adduser shraddha sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER shraddha
RUN sudo apt-get update 
```
#### :snowflake: Shell
```shell
$ docker build -t taskfour .
$ docker run -it --name taskfourc1 --network host taskfour
$ whoami
$ sudo apt-get install git
```

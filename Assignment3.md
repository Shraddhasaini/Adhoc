# :fish: [Assignment 3](https://www.youtube.com/watch?v=HzGLd6q9AH0)
--------------------------------------------------
## :one: TASK #1:
> To Dockerize a Django signup page with database

### Creating a Django sign-up application:
```shell
$ mkdir django_signup
$ cd django_signup

```
>>>>>>>>Create a sample Django-signup page

#### Prerequisites
* Installed Docker

* Installed docker-compose

* Your Django application code

#### Desired Specs
* Python 3.6

* MySQL 5.7 (or 5.X)

* docker compose version 3

#### Dockerfile
```text
FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /my_app_dir
WORKDIR /my_app_dir
ADD requirements.txt /my_app_dir/
RUN pip install — upgrade pip && pip install -r requirements.txt
ADD . /my_app_dir/
```

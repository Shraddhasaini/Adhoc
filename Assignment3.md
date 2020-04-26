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
#### docker-compose.yml
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

#### requirements.txt
```
appdirs==1.4.0
Django==1.10.5
packaging==16.8
pyparsing==2.1.10
six==1.10.0
mysqlclient==1.3.12
django-mysql==2.2.0
```
#### /settings.py
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

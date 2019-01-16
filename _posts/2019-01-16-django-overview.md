---
title: Django Python web server overview
author: Florian Courgey
layout: post
categories: [opensource,linux,server,python,django,]
---
While Django was created in 2005 by a newspaper web team, it is now a generic web development framework used by Big sites such as Instagram, Pinterest or BitBucket. Let's see in 5 minutes how 50 lines of code can create a fully featured CRUD modern web app.

<div class="text-center">🐍👑🌍</div>
<!--more-->
## Introduction
A Django project consists of multiple apps. Each app is structured following the [MVT pattern](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Introduction#What_does_Django_code_look_like): Models (Database entities with mappings), Views (same as the MVC "controllers") and Templates (same as the MVC "views"):
```bash
├── blog/
│   ├── models.py
│   ├── views.py
|   └── templates/
├── api/ # same structure as above
├── forum/ # same structure as above
└── project_settings/
```

## Installation and first project
```bash
$ python --version # 3.7.0
$ pip install django # 2.1.5
$ django-admin startproject django_overview && cd django_overview && tree
├── manage.py # main management command: run server, create app, migrate db..
└── django_overview/
    ├── settings.py # project-wide settings (installed apps, db settings, encoding key..)
    ├── urls.py # main router. Most of the time calls other apps' router
    └── wsgi.py # for deployment
$ ./manage.py runserver
Starting development server at http://127.0.0.1:8000/
```
Annnd check that everything's working as expected 🙃:
<div class="text-center">
  <video autoplay loop muted playsinline height="250">
    <source src="/assets/images/2019/01/django-overview-splash.mp4" type="video/mp4" />
  </video>
</div>

## Install admin
Django comes with a fully featured **authentication**, **permissions** and **backoffice** systems. You first need to update the database with the default migrations. To apply them, run the command `migrate`. Then, create an admin with `createsuperuser` and head to [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/):
```bash
$ ./manage.py migrate
$ ./manage.py createsuperuser
Username: admin
Password: admin
```
The Django admin home, with groups, users and password change:
![](/assets/images/2019/01/django-admin-home.jpg)

And the Update entity form, with breadcrumbs and the history of updates:
![](/assets/images/2019/01/django-admin-users-update.jpg)

## Dead simple CRUD app
Let's create our first CRUD app, an e-commerce store with sellable products. We got X steps:
1. Create the app structure with `startapp`
1. Enable the app in the project
1. Create our model for the database schema
1. Update the database with `makemigrations` and `migrate`
1. Activate the admin interface

### Create the app
```bash
$ chmod +x ./manage.py && ./manage.py startapp shop && tree # for Windows, just do "python manage.py startapp blog"
|   manage.py
├── shop # app folder
│   │   admin.py # blog backend
│   │   apps.py # application name
│   │   models.py # 1st main file: holds entities with db schema
│   │   tests.py # see XXX for testing with django
│   │   views.py # 2nd main file: holds routes & controllers
│   └───migrations # contains .py files for automatic database migrations
└───django_overview # no change here
```

### Activate the app
And activate the `shop` app in the `django_overview/settings.py` whitelisted apps:
```python
INSTALLED_APPS = [
    'shop',
    # ...
]
```

### Create the db schema
Edit `shop/models.py` to create our `Product` model:
```python
from django.db import models

class Product(models.Model):
    created_datetime = models.DateTimeField(auto_now_add=True)
    edited_datetime = models.DateTimeField(auto_now=True)
    name = models.CharField(max_length=255)
    notation = models.IntegerField(default=0)
    description = models.CharField(max_length=255, default='', blank=True)
    active = models.BooleanField(default=True)
```

### Update the db
```bash
$ ./manage.py makemigrations # creates shop/migrations/0001_initial.py
$ ./manage.py migrate # runs shop/migrations/0001_initial.py
```

### Activate the django app admin
Open `shop/admin.py` and add the following:
```python
from django.contrib import admin
from .models import Product
admin.site.register(Product)
```

That's it! Refresh the browser for [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/) and you can see that Django has created a new entry to do any CRUD operations:

New home with the `Shop > Products`:
![](/assets/images/2019/01/django-admin-home-with-products.jpg)

Add a product:
![](/assets/images/2019/01/django-admin-product-create.jpg)

Sweet!!

### Conclusion
Let's do a quick coverage report with `coverage.py` (`pip install coverage`):
```bash
$ coverage run --omit manage.py --source . manage.py runserver
# Go to http://127.0.0.1:8000/admin/ to run at least 1 page, then Ctrl-C to exit program
$ coverage report
Name                              Stmts   Miss  Cover
-----------------------------------------------------
django_overview/__init__.py           0      0   100%
django_overview/settings.py          18      0   100%
django_overview/urls.py               3      3     0%
django_overview/wsgi.py               4      4     0%
shop/__init__.py                      0      0   100%
shop/admin.py                         3      0   100%
shop/apps.py                          3      3     0%
shop/migrations/0001_initial.py       5      5     0%
shop/migrations/__init__.py           0      0   100%
shop/models.py                        8      0   100%
shop/tests.py                         1      1     0%
shop/views.py                         1      1     0%
-----------------------------------------------------
TOTAL                                46     17    63%
```

That's the power of django... **Less than 50 lines** of code for:
- Authentication (login/logout)
- User, groups and permissions management
- CRUD management via dedicated Admin interface
- Database migration
- Database abstraction (we worked with the standard SQLite database, but see [other supported DBs](https://docs.djangoproject.com/en/2.1/ref/databases/))
- MVC style, renamed as MVT:
  - Models
  - Views (shop/views.py which acts as a controller)
  - Templates (shop/templates/index.html with Django templating syntax)

➡️ Explore the Django MVT with the next tutorial [XXX](abc.com) ⬅️

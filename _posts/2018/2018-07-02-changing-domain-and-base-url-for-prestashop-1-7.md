---
title: Changing domain and base URL for PrestaShop 1.7
categories: [opensource,prestashop,prestashop 1.7]
---

How to change your main domain in case you change your host? Or how to setup your dev environment on localhost when you import a live Production environment?

You have to change different URLs and settings in the database. Here's how.

<!--more-->

Let's say you have a current working shop at https://my-domain-1.com/prefix1 and you want to change to https//my-domain-2/prefix2

```sql
# 0. edit your Database parameters in /app/config/parameters.php
# then, use these lines to update your configuration for your new host/domain
# 1. Shop URL
update *_shop_url set domain="my-domain-2", domain_ssl="my-domain-2" where main=1 and domain="my-domain-1";
# 2. Prefix
update *_shop_url set physical_uri="/prefix2/" where main=1 and domain="my-domain-2";
# 3. Enable (or disable) HTTPS
update *_configuration set PS_SSL_ENABLED=1; # 1=enable HTTPS, 0=disable HTTPS
# 4. Edit your /.htaccess by replacing "^my-domain-1$" by "^my-domain-2$"
```

So to set up a local environment under `http://localhost`, it gives us the following configuration:

```sql
# 0. edit your Database parameters in /app/config/parameters.php
# 1. then
update *_shop_url set domain="localhost", domain_ssl="localhost" where main=1 and domain="my-domain-1";
update *_shop_url set physical_uri="/" where main=1 and domain="localhost";
update *_configuration set PS_SSL_ENABLED=0;
# 2. Edit your /.htaccess by replacing "^my-domain-1$" by "^localhost$"
```

---
title: "Nginx configuration: Let's encrypt, WordPress, Prestashop"
categories: [https,  "Let's Encrypt",  opensource, prestashop,  prestashop 1.7,  server,  wordpress]
---

## Favicon and robots.txt

```nginx
# URL that contains "favicon"
location ~ favicon {
	log_not_found off;
	access_log off;
}
# URL equals to "/robots.txt"
location = /robots.txt {
	allow all;
	log_not_found off;
	access_log off;
}
```

## Allow Let's Encrypt ACME Challenge

```nginx
# Allow Let's Encrypt (URL starting with "/.well-known/acme-challenge")
location ~ ^/.well-known/acme-challenge {
	allow all;
}
```

## Deny all `dot files` (.htaccess, .htpasswd, &#8230;)

```nginx
# Deny all attempts to access hidden files such as .htaccess, .htpasswd, .DS_Store (Mac).
location ~ /\. {
	deny all;
	access_log off;
	log_not_found off;
}
```

## Serve raw files directly with Nginx

Don't use Nginx then Apache for static files, serve them directly

### for PrestaShop

```nginx
location ~ ^(/assets/|/img/|/dist/|/base/|/vendor/.+/Resources/public/) {
	try_files $uri 404;
}
```

### For WordPress

```nginx
location /wp-content {
	try_files $uri 404;
}
location /wp-includes {
	try_files $uri 404;
}
```

---
title: "Nginx.conf for Let's Encrypt auto https renewal"
redirect_from: /2018/05/nginx-conf-for-lets-encrypt-auto-https-renewal/
categories: [https, nginx, server]
---
Let's Encrypt uses a GET request to your website to automatically renew your certificate. Let's Encrypt may encounter some 403 unauthorized when trying to make this HTTP request because it is trying to connect to http://your-site.com/.well-known/acme-challenge/a-long-hash-here. How to authorize Let's Encrypt to connect? Let's find out if you got nginx set up as a reverse proxy!

<!--more-->

You can add this piece of code in your nginx.conf:

```nginx
server {
    [...]

    # Allow Let's Encrypt
    location ~ ^/.well-known/acme-challenge {
        allow all;
    }
}
```

- `~`  means it's a regex
- `^/.well-known/acme-challenge` is the beginning of the URL used by Let's Encrypt

Before, a 403 error:

![](/assets/images/2018/05/Capture-d’écran-2018-05-20-à-17.28.07.png)

After, a 404 (which is OK in our case):

![](/assets/images/2018/05/Capture-d’écran-2018-05-20-à-17.27.56.png)

&nbsp;

If you&#8217;re using Plesk, this configuration is found under Apache & Nginx settings of your website:

![](/assets/images/2018/05/Capture-d’écran-2018-05-20-à-17.34.12.png)

Which leads to this pretty handy text editor:

![](/assets/images/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png)

---
id: 526
title: 'Nginx.conf for Let&#8217;s Encrypt auto https renewal'
date: 2018-05-20T21:30:03+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=526
permalink: /2018/05/nginx-conf-for-lets-encrypt-auto-https-renewal/
categories:
  - https
  - nginx
  - server
---
Let&#8217;s Encrypt uses a GET request to your website to automatically renew your certificate. Let&#8217;s Encrypt may encounter some 403 unauthorized when trying to make this HTTP request because it is trying to connect to http://your-site.com/.well-known/acme-challenge/a-long-hash-here. How to authorize Let&#8217;s Encrypt to connect? Let&#8217;s find out if you got nginx set up as a reverse proxy!

<!--more-->

You can add this piece of code in your nginx.conf:

<pre class="lang:default decode:true " title="nginx.conf">server {
    [...]

    # Allow Let's Encrypt
    location ~ ^/.well-known/acme-challenge {
        allow all;
    }
}</pre>

<span class="lang:default decode:true crayon-inline ">~</span>  means you&#8217;re gonna use a regex

<span class="lang:default decode:true crayon-inline ">^/.well-known/acme-challenge</span>  is the beginning of the URL used by Let&#8217;s Encrypt.

Before, a 403 error:

<img class="aligncenter size-full wp-image-527" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.28.07.png?resize=525%2C105&#038;ssl=1" alt="" width="525" height="105" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.28.07.png?w=1336&ssl=1 1336w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.28.07.png?resize=300%2C60&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.28.07.png?resize=768%2C154&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.28.07.png?resize=1024%2C205&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

After, a 404 (which is OK in our case):

<img class="aligncenter size-full wp-image-528" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.27.56.png?resize=525%2C129&#038;ssl=1" alt="" width="525" height="129" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.27.56.png?w=1336&ssl=1 1336w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.27.56.png?resize=300%2C74&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.27.56.png?resize=768%2C189&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.27.56.png?resize=1024%2C251&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

&nbsp;

If you&#8217;re using Plesk, this configuration is found under Apache & Nginx settings of your website:

<img class="aligncenter size-full wp-image-532" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.34.12.png?resize=525%2C248&#038;ssl=1" alt="" width="525" height="248" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.34.12.png?w=1572&ssl=1 1572w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.34.12.png?resize=300%2C142&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.34.12.png?resize=768%2C363&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.34.12.png?resize=1024%2C485&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Which leads to a pretty handy text editor:

<img class="aligncenter size-full wp-image-533" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png?resize=525%2C289&#038;ssl=1" alt="" width="525" height="289" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png?w=1676&ssl=1 1676w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png?resize=300%2C165&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png?resize=768%2C422&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png?resize=1024%2C563&ssl=1 1024w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/05/Capture-d’écran-2018-05-20-à-17.33.48.png?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />
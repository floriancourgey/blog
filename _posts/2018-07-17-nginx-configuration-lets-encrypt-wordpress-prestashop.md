---
id: 808
title: 'Nginx configuration: Let&#8217;s encrypt, WordPress, Prestashop'
date: 2018-07-17T14:14:45+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=808
permalink: /2018/07/nginx-configuration-lets-encrypt-wordpress-prestashop/
categories:
  - https
  - "Let's Encrypt"
  - opensource
  - prestashop
  - prestashop 1.7
  - server
  - wordpress
---
## Favicon and robots.txt

<pre class="lang:default decode:true"># URL that contains "favicon"
location ~ favicon {
	log_not_found off;
	access_log off;
}
# URL equals to "/robots.txt"
location = /robots.txt {
	allow all;
	log_not_found off;
	access_log off;
}</pre>

## Allow Let&#8217;s Encrypt ACME Challenge

<pre class="lang:default decode:true "># Allow Let's Encrypt (URL starting with "/.well-known/acme-challenge")
location ~ ^/.well-known/acme-challenge {
	allow all;
}</pre>

## Deny all &#8220;dot files&#8221; (.htaccess, .htpasswd, &#8230;)

<pre class="lang:default decode:true "># Deny all attempts to access hidden files such as .htaccess, .htpasswd, .DS_Store (Mac).
location ~ /\. {
	deny all;
	access_log off;
	log_not_found off;
}</pre>

## Serve raw files directly with Nginx

Don&#8217;t use Nginx then Apache for static files, serve them directly

### for PrestaShop

<pre class="lang:default decode:true ">location ~ ^(/assets/|/img/|/dist/|/base/|/vendor/.+/Resources/public/) {
	try_files $uri 404;
}</pre>

### For WordPress

<pre class="lang:default decode:true ">location /wp-content {
	try_files $uri 404;
}
location /wp-includes {
	try_files $uri 404;
}</pre>

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;
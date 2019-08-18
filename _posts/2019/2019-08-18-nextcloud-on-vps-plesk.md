---
title: Nextcloud on your own VPS with Plesk OVH
categories: [opensource,nextcloud,plesk]
---
Excerpt here...
<p class="text-center">🐍👑🌍</p>
<!--more-->

## Versions used
- OVH VPS with Ubuntu 14 http://releases.ubuntu.com/14.04/
- Plesk for OVH https://www.ovh.com/fr/hebergement-plesk/ Version 17 https://docs.plesk.com/release-notes/onyx/change-log/
- Nextcloud 15 https://docs.nextcloud.com/server/15/admin_manual/contents.html

## Plesk setup
- Create a webspace cloud.your_address.com (lives at `/var/www/vhosts/your_address.com/cloud.your_address.com/`)
- Create a webspace user `cloud_user` 
- SSH as admin to the webspace folder and download the `.tar.bz2` archive from https://nextcloud.com/install/#instructions-server e.g. `wget https://download.nextcloud.com/server/releases/nextcloud-15.0.11.tar.bz2`
- Untar with `tar -xjf nextcloud-15.0.11.tar.bz2`
- Set owner for the root folder `sudo chown plesk_user:www-data nextcloud`
- Set recursive owner for selected folders `cd nextcloud && sudo chmown -R plesk_user:www-data apps config data themes updater`
- Give recursive write permissions for group `sudo chmod -R g+w config data`
- Give execute permission to the `occ` binary: `sudo chmod +x occ`
- Result:
```console
admin@vps666666 /var/www/vhosts/your_address.com/cloud.your_address.com/nextcloud> ll
drwxr-xr-x 32 plesk_user psacln   4.0K Aug 18 11:34 3rdparty/
-rw-r--r--  1 plesk_user psacln    12K Aug 18 11:34 AUTHORS
-rw-r--r--  1 plesk_user psacln    34K Aug 18 11:34 COPYING
drwxr-xr-x 41 plesk_user www-data 4.0K Aug 18 11:35 apps/
drwxrwxr-x  2 plesk_user www-data 4.0K Aug 18 11:34 config/
-rw-r--r--  1 plesk_user psacln   3.6K Aug 18 11:34 console.php
drwxr-xr-x 19 plesk_user psacln   4.0K Aug 18 11:34 core/
-rwxr-xr-x  1 plesk_user psacln    283 Aug 18 11:34 occ*
```
- Install `sudo -u plesk_user php occ maintenance:install --database`

## Set up Let's encrypt challenge
- Go to `Apache & Nginx Settings`
- Set the following for `Additional nginx directives`:
```nginx
# Allow Let's Encrypt (URL starting with "/.well-known/acme-challenge")
location ~ ^/.well-known/acme-challenge {
    allow all;
}
```

## Nginx optimizations
```nginx
# TAKEN FROM https://docs.nextcloud.com/server/12/admin_manual/installation/nginx.html

# security
location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
	deny all;
}
location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console) {
	deny all;
}
add_header Strict-Transport-Security max-age=15552000;

# set max upload size
fastcgi_buffers 64 4K;

# Enable gzip but do not remove ETag headers
gzip on;
gzip_vary on;
gzip_comp_level 4;
gzip_min_length 256;
gzip_proxied expired no-cache no-store private no_last_modified no_etag auth;
gzip_types application/atom+xml application/javascript application/json application/ld+json application/manifest+json application/rss+xml application/vnd.geo+json application/vnd.ms-fontobject application/x-font-ttf application/x-web-app-manifest+json application/xhtml+xml application/xml font/opentype image/bmp image/svg+xml image/x-icon text/cache-manifest text/css text/plain text/vcard text/vnd.rim.location.xloc text/vtt text/x-component text/x-cross-domain-policy;
```

## Upgrade and update
- Databases indexes "Some database indexes are missing" sudo -u cloud_user ./occ db:add-missing-indices
- Big integer "Some columns in the database are missing a conversion to big int." sudo -u cloud_user ./occ db:convert-filecache-bigint

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
- SSH to the webspace folder and download the `.tar.bz2` archive from https://nextcloud.com/install/#instructions-server e.g. `wget https://download.nextcloud.com/server/releases/nextcloud-15.0.11.tar.bz2`
- Untar with `tar -xjf nextcloud-15.0.11.tar.bz2`
- Set owner for the root folder `chown plesk_user:www-data nextcloud`
- Set recursive owner for selected folders `cd nextcloud && chmown -R plesk_user:www-data apps config data themes updater`
- Give recursive write permissions for group `chmod -R g+w config data`

Result:
```console
admin@vps325733 /var/www/vhosts/your_address.com/cloud.your_address.com/nextcloud> ll
drwxr-xr-x 32 plesk_user psacln   4.0K Aug 18 11:34 3rdparty/
-rw-r--r--  1 plesk_user psacln    12K Aug 18 11:34 AUTHORS
-rw-r--r--  1 plesk_user psacln    34K Aug 18 11:34 COPYING
drwxr-xr-x 41 plesk_user www-data 4.0K Aug 18 11:35 apps/
drwxrwxr-x  2 plesk_user www-data 4.0K Aug 18 11:34 config/
-rw-r--r--  1 plesk_user psacln   3.6K Aug 18 11:34 console.php
drwxr-xr-x 19 plesk_user psacln   4.0K Aug 18 11:34 core/
```



## Upgrade and update
- Databases indexes "Some database indexes are missing" sudo -u cloud_user ./occ db:add-missing-indices
- Big integer "Some columns in the database are missing a conversion to big int." sudo -u cloud_user ./occ db:convert-filecache-bigint

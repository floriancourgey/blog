---
id: 283
title: System information disabled due to load higher than 1.0 (My linux server is full !)
date: 2018-03-30T17:52:51+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=283
permalink: /2018/03/system-information-disabled-due-to-load-higher-than-1-0-my-linux-server-is-full/
categories:
  - linux
  - server
---
Petit plaisir de te logger en SSH et de tomber sur :

<img class="aligncenter size-full wp-image-285" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/03/Image-166.png?resize=525%2C148&#038;ssl=1" alt="" width="525" height="148" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/03/Image-166.png?w=582&ssl=1 582w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/03/Image-166.png?resize=300%2C85&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

&#8220;System information disabled due to load higher than 1.0&#8221;

En francais : &#8220;T&#8217;es vraiment dans la merde, ton serveur est plein&#8221;

# Version stylee : [Space Radar](https://github.com/zz85/space-radar)

<img style="font-size: 1rem;" src="https://i2.wp.com/cloud.githubusercontent.com/assets/314997/11022585/5c847364-869d-11e5-8079-0a16e7d747e4.gif?w=525&#038;ssl=1" data-recalc-dims="1" />

Installer sur un client [Space Radar](https://github.com/zz85/space-radar) et sur le serveur lancer

<pre class="lang:sh decode:true ">du -ak /var/log /usr | gzip -c &gt; /tmp/sizes.txt.gz</pre>

Voir [le repo Space Radar](https://github.com/zz85/space-radar#reading-from-a-file-)

# Version commando : la ligne de commande

## Quelle partition est pleine ?

<pre class="lang:sh decode:true">$ df
Filesystem 1K-blocks Used Available Use% Mounted on
udev 991316 0 991316 0% /dev
tmpfs 199908 20936 178972 11% /run
/dev/vda1 10287416 9833040 4196 100% /
tmpfs 999528 0 999528 0% /dev/shm
tmpfs 5120 24 5096 1% /run/lock
tmpfs 999528 0 999528 0% /sys/fs/cgroup
cgmfs 100 0 100 0% /run/cgmanager/fs
tmpfs 199908 0 199908 0% /run/user/1000</pre>

## Quel repertoire est plein ?

<pre class="lang:sh decode:true">$ du -h --max-depth=1 / | sort -hr
9,4G /
5,2G /var
2,1G /usr
1,4G /opt
560M /root
158M /lib
57M /boot
49M /home
21M /run
13M /etc
13M /bin
9,9M /sbin
3,9M /lib32
3,1M /tmp</pre>

S&#8217;il reste un peu de place sur le serveur, [ncdu (ncurse disk usage)](https://dev.yorhel.nl/ncdu/scr) peut valoir le coup :

<img class="alignnone size-full" src="https://i1.wp.com/dev.yorhel.nl/img/ncduinfo-2.png?resize=525%2C297&#038;ssl=1" width="525" height="297" data-recalc-dims="1" />

## Quelles solutions si je ne veux pas toucher a mes fichiers ?

### Supprimer les logs rotated

<pre class="lang:sh decode:true">$ ll /var/log/*.gz # petit check
$ rm /var/log/*.gz</pre>
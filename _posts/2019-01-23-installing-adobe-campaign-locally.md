---
title: Install Adobe Campaign Architecture locally (Virtualbox)
author: Florian Courgey
layout: post
categories: [opensource,adobe campaign]
---

<p class="text-center">⏬📦✔️</p>

<!--more-->

- Installation guide for AC6.1 https://docs.campaign.adobe.com/doc/archives/en/610/installation-v6.1-en.pdf
- `thirdparty6-XXXX-.rpm` is now included in the main package, cf https://docs.campaign.adobe.com/doc/AC/en/RN_legacy.html#8763
- Installation guide for AC7 https://docs.campaign.adobe.com/doc/AC/en/INS_Installing_Campaign_in_Linux__Prerequisites.html

## Prerequisites: CentOS 7 x64 on Virtualbox
1. Get virtual box from [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
1. Get Fedora ISO from [centos.org/download](https://www.centos.org/download/). I'll be using [CentOS-7-x86_64-DVD-1810.iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1810.iso)
1. Spin up a Fedora instance with the ISO loaded, and install it with the Software Selection "Server with a GUI" and "Connected to Ethernet" ([instructions on youtube](https://www.youtube.com/watch?v=Pcl417NR2xc))
![](/assets/images/2019/02/fedora-workstation-install-disk.jpg)
1. Shutdown the machine, remove the ISO from the boot settings, restart the machine, accept the licence and log in
1. Open up a terminal. You should have the following:
![](/assets/images/2019/02/fedora-workstation-first-terminal.jpg)
1. Install Virtual Box Guest Addition to enable copy/paste
1. Optional: Install Gnome instead of Gnome Classic, see [tuto on stackexchange](https://unix.stackexchange.com/questions/181503/how-to-install-desktop-environments-on-centos-7)
1. see https://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/#C1 for details

## Install Adobe Campaign
Let's do all of our work in `~/ac`
```bash
$ cd && mkdir ac && cd ac
```

### Pre req
Apache
```bash
$ sudo yum install -y httpd
$ sudo systemctl start httpd # start now
$ sudo systemctl enable httpd # start at boot
$ service httpd status && curl localhost # check
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2019-02-06 16:53:12 EST; 1min 22s ago
[...]</body></html>
$ sudo firewall-cmd --add-service=http --permanent # allow firewall http
$ sudo firewall-cmd --add-service=https --permanent # allow firewall https
$ sudo systemctl restart firewalld # restart firewall daemon
```
Java
```bash
$ java -version
openjdk version "1.8.0_191"
OpenJDK Runtime Environment (build 1.8.0_191-b12)
OpenJDK 64-Bit Server VM (build 25.191-b12, mixed mode)
```

### AC7
Download the `.rpm` file from the Download Center, see the instructions in this post. Then:
```bash
$ sudo yum install -y ./nlserver6-8864-x86_64_rh7.rpm
$ sudo /etc/init.d/nlserver6 start
$ sudo service nlserver6 status
14:20:41 >   Application server for Adobe Campaign (6.1.1 build 8864) of 03/02/2018
watchdog (3959) - 4.8 MB
syslogd@default (3520) - 12.7 MB
web@default (3780) - 106.4 MB
```

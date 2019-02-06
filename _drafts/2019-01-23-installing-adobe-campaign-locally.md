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

## Prerequisites: Fedora on Virtualbox
1. Get virtual box https://www.virtualbox.org/wiki/Downloads
1. Get Fedora ISO https://getfedora.org/en/workstation/download/
1. Spin up a Fedora instance with the ISO loaded
![](/assets/images/2019/02/fedora-workstation-install-disk.jpg)
1. Shutdown the machine, remove the ISO from the boot settings, restart the machine and create a new user
1. Open up a terminal and you should have the following:
![](/assets/images/2019/02/fedora-workstation-first-terminal.jpg)

## Install Adobe Campaign
Download the `.rpm` file from the Download Center, see the instructions in this post 
```bash
$ cd ~
$ wget https://rpmfind.net/linux/centos/7.6.1810/os/x86_64/Packages/libicu-50.1.2-17.el7.x86_64.rpm
$ sudo install -y ./libicu-50.1.2-17.el7.x86_64.rpm
$ sudo yum install -y ./nlserver6-8864-x86_64_rh7.rpm
```


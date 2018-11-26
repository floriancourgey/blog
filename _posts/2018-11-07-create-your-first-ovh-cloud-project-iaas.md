---
id: 1048
title: Create your first OVH cloud project IaaS
date: 2018-11-07T22:49:36+00:00
author: Florian Courgey
layout: post
permalink: /2018/11/create-your-first-ovh-cloud-project-iaas/
categories:
  - apache
  - https
  - linux
  - opensource
  - ovh
  - server
---
Simple VPS provisionning with basic LAMP server via OVH Manager and [OVH Public Cloud](https://www.ovh.co.uk/public-cloud/instances/features/). We will go through the whole process: creating the instance, configuring it, connecting via SSH to install Apache and then finally testing the connection.

<!--more-->

![todo](/assets/images/2018/11/ovh-manager-cloud-overview.jpg)

## Pre-requisites

  * OVH account with Manager Access
  * Basic Linux knowledge (SSH, vim, apt)
  * Motivation 😃
  * Estimated time of completion: 10 min

## Add your SSH Key in the OVH Manager

Refer to [https://docs.ovh.com/gb/en/public-cloud/create-ssh-keys/](https://docs.ovh.com/gb/en/public-cloud/create-ssh-keys/) to create one. Have your public+private key saved somewhere as TXT format, no matter the extension.

In your OVH Manager, go to 'Cloud > Create new Project > Fill info > SSH Keys > Add > Add your public SSH Key'.

![todo](/assets/images/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg)

## Create the VPS instance!

`Infrastructure > Actions > Add a server`:

![todo](/assets/images/2018/11/ovh-manager-cloud-add-server-instance.jpg)

&nbsp;

  * Select your closest geographic area, i.e. London UK 1
  * Select Debian 9
  * Select the cheapest, S1-2, which stands for Server 1 vCore CPU  + 2BG RAM + 10 Go HDD
  * The SSH Key should be pre-selected
  * Leave Advanced options as is
  * Click **Launch Now**

![todo](/assets/images/2018/11/ovh-manager-cloud-configure-s1-2.jpg)

&nbsp;

Wait 2-5 minutes and a popup should appear with the server IP and the linux root username. In my case it was `ssh debian@54.38.40.76`. To open this window again click on 'Login Informations'.

![todo](/assets/images/2018/11/ovh-manager-cloud-login-information.jpg)

Let's connect and run a quick enumeration:

![todo](/assets/images/2018/11/ovh-manager-cloud-quick-enumeration.jpg)

Server is up and running, great!!

## Install Apache and create a HTML test page

```bash
$ sudo apt update # refresh all repo
$ sudo apt install apache2 # install apache
$ cd # make sure we are in our home folder
$ mkdir public_html && cd public_html # create public_html, per Apache convention
$ touch index.html && echo "Hello world from OVH Cloud Iaas!" > index.html # create basic html file
$ sudo chgrp www-data ~/public_html # edit permission to have www-data as group owner
$ sudo a2enmod userdir # enable apache module "userdir"
$ sudo service apache2 restart # restart apache
```

See [https://wiki.debian.org/LaMp](https://wiki.debian.org/LaMp) for details

And that's it! Open `http://54.38.40.76/~debian/` in a browser:

![todo](/assets/images/2018/11/ovh-manager-instance-is-running.jpg)

## Advanced configuration with OpenStack Dashboard: Horizon

Open the advanced dashboard through the tab OpenStack. Create a user and start Horizon:

![todo](/assets/images/2018/11/ovh-manager-openstack-horizon.jpg)

It will open in a new tab:

![todo](/assets/images/2018/11/ovh-manager-openstack-horizon-dashboard.jpg)

&nbsp;

Browse to your instances, and find an overview, the server log and an open stack console:

![todo](/assets/images/2018/11/ovh-manager-openstack-horizon-instance-overview.jpg)

## Add alert with usage threshold (I ain't paying more than 1€ per month!!)

`Project Management > Usage > Estimate of my next invoice > Create alert`:

![todo](/assets/images/2018/11/ovh-manager-add-alert.jpg)

## Going further

  * Install full LAMP with PHP and MySQL
  * Install [Plesk](https://www.plesk.com/) for server management made easy (hostnames, HTTPs, one-click wordpress, cron via UI, users...)
  * Install and connect 100Go Storage disk to host [nextcloud](https://nextcloud.com/) data

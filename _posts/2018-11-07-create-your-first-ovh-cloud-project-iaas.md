---
id: 1048
title: Create your first OVH cloud project IaaS
date: 2018-11-07T22:49:36+00:00
author: Florian Courgey
layout: post
guid: https://floriancourgey.com/?p=1048
permalink: /2018/11/create-your-first-ovh-cloud-project-iaas/
tinymce-comment-field_enabled:
  - "1"
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

<img class="aligncenter size-full wp-image-1057" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-overview.jpg?resize=525%2C199&#038;ssl=1" alt="" width="525" height="199" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-overview.jpg?w=1798&ssl=1 1798w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-overview.jpg?resize=300%2C113&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-overview.jpg?resize=768%2C290&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-overview.jpg?resize=1024%2C387&ssl=1 1024w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-overview.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Pre-requisites

  * OVH account with Manager Access
  * Basic Linux knowledge (SSH, vim, apt)
  * Motivation 😃
  * Estimated time of completion: 10 min

## Add your SSH Key in the OVH Manager

Refer to https://docs.ovh.com/gb/en/public-cloud/create-ssh-keys/ to create one. Have your public+private key saved somewhere as TXT format , no matter the extension.

In your OVH Manager, go to &#8220;Cloud > Create new Project > Fill info > SSH Keys > Add > Add your public SSH Key&#8221;.

<img class="aligncenter size-full wp-image-1049" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg?resize=525%2C171&#038;ssl=1" alt="" width="525" height="171" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg?w=1920&ssl=1 1920w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg?resize=300%2C98&ssl=1 300w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg?resize=768%2C250&ssl=1 768w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg?resize=1024%2C333&ssl=1 1024w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-ssh-keys.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Create the VPS instance!

&#8220;Infrastructure > Actions > Add a server&#8221;:

<img class="aligncenter size-full wp-image-1050" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-add-server-instance.jpg?resize=525%2C235&#038;ssl=1" alt="" width="525" height="235" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-add-server-instance.jpg?w=690&ssl=1 690w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-add-server-instance.jpg?resize=300%2C134&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

&nbsp;

  * Select your closest geographic area, i.e. London UK 1
  * Select Debian 9
  * Select the cheapest, S1-2, which stands for Server 1 vCore CPU  + 2BG RAM + 10 Go HDD
  * The SSH Key should be pre-selected
  * Leave Advanced options as is
  * Click **Launch Now**

<img class="aligncenter size-full wp-image-1051" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-configure-s1-2.jpg?resize=525%2C498&#038;ssl=1" alt="" width="525" height="498" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-configure-s1-2.jpg?w=914&ssl=1 914w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-configure-s1-2.jpg?resize=300%2C285&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-configure-s1-2.jpg?resize=768%2C729&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

&nbsp;

Wait 2-5 minutes and a popup should appear with the server IP and the linux root username. In my case it was <span class="lang:default decode:true crayon-inline ">ssh debian@54.38.40.76</span> . To open this window again click on &#8220;Login Informations&#8221;.

<img class="aligncenter size-full wp-image-1053" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-instance.jpg?resize=525%2C146&#038;ssl=1" alt="" width="525" height="146" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-instance.jpg?w=1567&ssl=1 1567w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-instance.jpg?resize=300%2C83&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-instance.jpg?resize=768%2C213&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-manage-instance.jpg?resize=1024%2C284&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" /><img class="aligncenter size-full wp-image-1052" src="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-login-information.jpg?resize=525%2C264&#038;ssl=1" alt="" width="525" height="264" srcset="https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-login-information.jpg?w=602&ssl=1 602w, https://i1.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-login-information.jpg?resize=300%2C151&ssl=1 300w" sizes="(max-width: 525px) 100vw, 525px" data-recalc-dims="1" />

Let&#8217;s connect and run a quick enumeration:

<img class="aligncenter size-full wp-image-1054" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-quick-enumeration.jpg?resize=525%2C183&#038;ssl=1" alt="" width="525" height="183" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-quick-enumeration.jpg?w=917&ssl=1 917w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-quick-enumeration.jpg?resize=300%2C104&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-cloud-quick-enumeration.jpg?resize=768%2C267&ssl=1 768w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

Server is up and running, great!!

## Install Apache and create a HTML test page

<pre class="lang:sh decode:true">$ sudo apt update # refresh all repo
$ sudo apt install apache2 vim # install apache and vim (or any other)
$ cd # make sure we are in our home folder
$ mkdir public_html && cd public_html # create public_html, per Apache convention
$ vim index.html # create basic html file
Hello world from OVH Cloud Iaas!
$ sudo chgrp www-data ~/public_html # edit permission to have www-data as group owner
$ sudo a2enmod userdir # enable apache module "userdir"
$ sudo service apache2 restart # restart apache
</pre>

See https://wiki.debian.org/LaMp for details

And that&#8217;s it! Open <span class="lang:default decode:true crayon-inline ">http://54.38.40.76/~debian/</span>  in a browser:

<img class="aligncenter size-full wp-image-1055" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-instance-is-running.jpg?resize=449%2C111&#038;ssl=1" alt="" width="449" height="111" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-instance-is-running.jpg?w=449&ssl=1 449w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-instance-is-running.jpg?resize=300%2C74&ssl=1 300w" sizes="(max-width: 449px) 100vw, 449px" data-recalc-dims="1" />

## Advanced configuration with OpenStack Dashboard: Horizon

Open the advanced dashboard through the tab OpenStack. Create a user and start Horizon:

<img class="aligncenter size-full wp-image-1060" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon.jpg?resize=525%2C203&#038;ssl=1" alt="" width="525" height="203" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon.jpg?w=1538&ssl=1 1538w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon.jpg?resize=300%2C116&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon.jpg?resize=768%2C298&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon.jpg?resize=1024%2C397&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

It will open in a new tab:

<img class="aligncenter size-full wp-image-1061" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-dashboard.jpg?resize=525%2C138&#038;ssl=1" alt="" width="525" height="138" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-dashboard.jpg?w=1903&ssl=1 1903w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-dashboard.jpg?resize=300%2C79&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-dashboard.jpg?resize=768%2C201&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-dashboard.jpg?resize=1024%2C269&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-dashboard.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

&nbsp;

Browse to your instances, and find an overview, the server log and an open stack console:

<img class="aligncenter size-full wp-image-1062" src="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-instance-overview.jpg?resize=525%2C301&#038;ssl=1" alt="" width="525" height="301" srcset="https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-instance-overview.jpg?w=1027&ssl=1 1027w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-instance-overview.jpg?resize=300%2C172&ssl=1 300w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-instance-overview.jpg?resize=768%2C440&ssl=1 768w, https://i0.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-openstack-horizon-instance-overview.jpg?resize=1024%2C587&ssl=1 1024w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Add alert with usage threshold (I ain&#8217;t paying more than 1€ per month!!)

&#8220;Project Management > Usage > Estimate of my next invoice > Create alert&#8221;:

<img class="aligncenter size-full wp-image-1065" src="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-add-alert.jpg?resize=525%2C209&#038;ssl=1" alt="" width="525" height="209" srcset="https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-add-alert.jpg?w=1631&ssl=1 1631w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-add-alert.jpg?resize=300%2C119&ssl=1 300w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-add-alert.jpg?resize=768%2C305&ssl=1 768w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-add-alert.jpg?resize=1024%2C407&ssl=1 1024w, https://i2.wp.com/floriancourgey.com/wp-content/uploads/2018/11/ovh-manager-add-alert.jpg?w=1575&ssl=1 1575w" sizes="(max-width: 767px) 89vw, (max-width: 1000px) 54vw, (max-width: 1071px) 543px, 580px" data-recalc-dims="1" />

## Going further

  * Install full LAMP with PHP and MySQL
  * Install [Plesk](https://www.plesk.com/) for server management made easy (hostnames, HTTPs, one-click wordpress, cron via UI, users&#8230;)
  * Install and connect 100Go Storage disk to host [nextcloud](https://nextcloud.com/) data
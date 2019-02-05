---
title: Install Adobe Campaign Architecture locally (Virtualbox)
author: Florian Courgey
layout: post
categories: [opensource,adobe campaign]
---

<p class="text-center">🐍👑🌍</p>

<!--more-->

- Installation guide for AC6.1 https://docs.campaign.adobe.com/doc/archives/en/610/installation-v6.1-en.pdf
- `thirdparty6-XXXX-.rpm` is now included in the main package, cf https://docs.campaign.adobe.com/doc/AC/en/RN_legacy.html#8763

1. Get virtual box here: https://www.virtualbox.org/wiki/Downloads
1. Get Fedora ISO here: https://getfedora.org/en/workstation/download/
1. Spin up a Fedora instance with the ISO loaded
1. Download the .rpm file from the Download Center, see the instructions in this post 
1. `yum install -y ./nlserver6-8864-x86_64_rh7.rpm`
1. `yum install -y libicu-devel`

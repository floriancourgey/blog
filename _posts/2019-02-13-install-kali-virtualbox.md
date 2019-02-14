---
title: Install Kali Linux on VirtualBox
categories: [opensource,kali,security]
---
Excerpt here...

<p class="text-center">🐍👑🌍</p>

<!--more-->

**bold** *italic*  ~~strikethrough~~

## Use h2 for each section

- hostname: `kali.local`
- root password: mandatory, otherwise need to create another user
- use mirror with no proxy
- install grub on main
- reboot

```bash
\# apt update
\# apt install virtualbox-guest-x11 # see https://docs.kali.org/general-use/kali-linux-virtual-box-guest
\# reboot
```

If you get `Could not get lock /var/lib/dpkg/lock-frontend`:
```bash
\# fuser /var/lib/dpkg/lock-frontend # see https://linuxconfig.org/could-not-get-lock-var-lib-dpkg-lock-ubuntu-debian
/var/lib/dpkg/lock-frontend: 697
\# ps -p 697
packagekitd
\# dconf write /org/gnome/software/download-updates false # see https://unix.stackexchange.com/questions/280015/what-does-the-process-usr-libexec-packagekitd-do
```


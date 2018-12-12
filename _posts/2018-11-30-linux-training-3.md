---
title: "Linux training with overthewire [Part 3/10: Bandit 21-30]"
author: Florian Courgey
layout: post
categories:
  - opensource
  - linux
  - bash
  - shell
  - hack
  - server
---
Excerpt here...
<!--more-->

This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-2 %})
- Linux training with overthewire Part 3: Bandit 21-30

### Level 21 - CRON
```bash
ssh -p 2220 bandit21@bandit.labs.overthewire.org
# gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr http://overthewire.org/wargames/bandit/bandit22.html
```
```bash
$ cat /etc/cron.d/
cronjob_bandit22  cronjob_bandit23  cronjob_bandit24
$ cat /etc/cron.d/cronjob_bandit22
@reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
$ cat /usr/bin/cronjob_bandit22.sh
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
$ cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI
```

### Level 22 - Bash script 1
```bash
ssh -p 2220 bandit22@bandit.labs.overthewire.org
# Yk7owGAcWjwMVRwrTesJEwB7WVOiILLI http://overthewire.org/wargames/bandit/bandit23.html
```
```bash
$ cat /etc/cron.d/cronjob_bandit23
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
$ cat /usr/bin/cronjob_bandit23.sh
#!/bin/bash
myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
$ myname=bandit23 && echo $(echo I am user $myname | md5sum | cut -d ' ' -f 1)
8ca319486bfbbc3663ea0fbe81326349
$ cat /tmp/8ca319486bfbbc3663ea0fbe81326349
jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n
```

### Level 23 - Bash script 2
```bash
ssh -p 2220 bandit23@bandit.labs.overthewire.org
# jc1udXuA1tiHqjIsL8yaapX5XIAI6i0n http://overthewire.org/wargames/bandit/bandit24.html
```
```bash
$ cat /usr/bin/cronjob_bandit24.sh
#!/bin/bash
myname=$(whoami)
cd /var/spool/$myname
echo "Executing and deleting all scripts in /var/spool/$myname:"
$ ls /var/spool/bandit24/
lol.sh  script.sh
$ cat /var/spool/bandit24/*
#!/bin/sh
cat /etc/bandit_pass/bandit24 > /tmp/tmp.AuFwziaI3a/lol.txt
$ cat /tmp/tmp.AuFwziaI3a/lol.txt
UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ
```

### Level 23 -
```bash
ssh -p 2220 bandit23@bandit.labs.overthewire.org
# UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ http://overthewire.org/wargames/bandit/bandit24.html
```

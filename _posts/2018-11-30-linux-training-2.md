---
title: "Linux training with overthewire [Part 2/10: Bandit 11-20]"
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
- Linux training with overthewire Part 2: Bandit 11-20
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-3 %})
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-4 %})

### Level 11 - ROT13 without any programming language
```bash
ssh -p 2220 bandit11@bandit.labs.overthewire.org
# IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR http://overthewire.org/wargames/bandit/bandit12.html
```
As ROT13 is often a good exercice to learn a programming language, let's try to use only the classic linux binaries.

`tr` is a good candidate as it translates an alphabet to another, such ah ABC to NOP with `'ABC' 'NOP'`. Or the whole alphabet with `'A-Za-z' 'N-ZA-Mn-za-m'`:
```bash
$ cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
The password is 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
```

### Level 12 - Gzip, bzip & tar
```bash
ssh -p 2220 bandit12@bandit.labs.overthewire.org
# 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu http://overthewire.org/wargames/bandit/bandit13.html
```
```bash
$ mktemp -d
/tmp/tmp.d945UMcX04
$ xxd -r data.txt /tmp/tmp.d945UMcX04/love
$ cd /tmp/tmp.d945UMcX04 && file love
love: gzip compressed data, was "data2.bin", last modified: Tue Oct 16 12:00:23 2018, max compression, from Unix
$ mv love data2.bin.gz && gzip -d data2.bin.gz && file data2.bin
data2.bin: bzip2 compressed data, block size = 900k
$ bunzip2 data2.bin && file data2.bin.out
data2.bin.out: gzip compressed data, was "data4.bin", last modified: Tue Oct 16 12:00:23 2018, max compression, from Unix
$ mv data2.bin.out data4.bin.gz && gzip -d data4.bin.gz && file data4.bin
data4.bin: POSIX tar archive (GNU)
$ tar xvf data4.bin
data5.bin
$ file data5.bin
data5.bin: POSIX tar archive (GNU)
$ tar xvf data5.bin
data6.bin
$ file data6.bin
data6.bin: bzip2 compressed data, block size = 900k
$ bunzip2 data6.bin && file data6.bin.out
data6.bin.out: POSIX tar archive (GNU)
$ tar xvf data6.bin.out
data8.bin
$ file data8.bin
data8.bin: gzip compressed data, was "data9.bin", last modified: Tue Oct 16 12:00:23 2018, max compression, from Unix
$ mv data8.bin data9.bin.gz && gzip -d data9.bin.gz && file data9.bin
data9.bin: ASCII text
```
And finally:
```bash
$ cat data9.bin
The password is 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
```

### Level 13 - SSH with private key
```bash
ssh -p 2220 bandit13@bandit.labs.overthewire.org
# 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL http://overthewire.org/wargames/bandit/bandit14.html
```
A SSH connection can be made with either a login/pwd pair or with a public/private keys pair. Here, we got the private key, that acts like a password, just pass it to the `-i` option:
```bash
bandit13@bandit:~$ ls
sshkey.private
bandit13@bandit:~$ ssh bandit14@localhost -i sshkey.private
bandit14@bandit:~$ cat /etc/bandit_pass/bandit14
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
```

### Level 14 - Raw TCP/UDP connection with `nc`
```bash
ssh -p 2220 bandit14@bandit.labs.overthewire.org
# 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e http://overthewire.org/wargames/bandit/bandit15.html
```
Send TCP/UDP data to server/port with `nc`:
```bash
$ cat /etc/bandit_pass/bandit14 | nc localhost 30000
BfMYroe26WYalil77FoDi9qh59eK5xNr
```

> We also learn that passwords are stored as text files in `/etc/bandit_pass/bandit{level}`

### Level 15 - SSL connection with `openssl`
```bash
ssh -p 2220 bandit15@bandit.labs.overthewire.org
# BfMYroe26WYalil77FoDi9qh59eK5xNr http://overthewire.org/wargames/bandit/bandit16.html
```
`openssl` comes with a lot of tools, such as Creation and Management of keys, Certificates Creation, SSL client, etc ([man openssl](https://linux.die.net/man/1/openssl)). We are going to use the SSL client `s_client` [man s_client](https://linux.die.net/man/1/s_client):
```bash
$ cat /etc/bandit_pass/bandit15 | openssl s_client -ign_eof -connect localhost:30001
cluFn7wTiGryunymYOu4RcffSxQluehd
```

### Level 16 - Scan server ports with `nmap`
```bash
ssh -p 2220 bandit16@bandit.labs.overthewire.org
# cluFn7wTiGryunymYOu4RcffSxQluehd http://overthewire.org/wargames/bandit/bandit17.html
```
`nmap` is one of the best tools for server pentesting and auditing: it guesses OS name, open ports, running services, firewalls and many other features. See [man nmap](https://linux.die.net/man/1/nmap).
```bash
$ nmap -sV localhost -p31000-32000
PORT      STATE SERVICE     VERSION
31518/tcp open  ssl/echo
31790/tcp open  ssl/unknown
31960/tcp open  echo
```
Looks like 31518 and 31960 will just `echo`, so let's try 31790:
```bash
$ echo "test" | openssl s_client -ign_eof -connect localhost:31790
Wrong! Please enter the correct current password
$ cat /etc/bandit_pass/bandit16 | openssl s_client -ign_eof -connect localhost:31790
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----
```
Copy from `-----BEGIN` (included) to `PRIVATE KEY-----` (included) and paste it in a local file on your computer as `bandit17_private_key`.


### Level 17 - Find differences with `diff`
```bash
ssh -p 2220 bandit17@bandit.labs.overthewire.org -i bandit17_private_key
# use bandit17_private_key from above http://overthewire.org/wargames/bandit/bandit18.html
```
```bash
$ diff passwords.old passwords.new -y --suppress-common-lines
hlbSBPAWJmL6WFDb06gpTx1pPButblOA                              | kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
```
I find the default options less clear but it works as well:
```bash
$ diff passwords.old passwords.new
42c42
< hlbSBPAWJmL6WFDb06gpTx1pPButblOA
---
> kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd
```

### Level 18 - Modified `.bashrc` to force logout
```bash
ssh -p 2220 bandit18@bandit.labs.overthewire.org -t "sh"
# kfBf3eYk5BPBRzwjqutbbfE887SVc5Yd http://overthewire.org/wargames/bandit/bandit19.html
$ cat readme
IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x
```

### Level 19 - Binary exploit with EUID
```bash
ssh -p 2220 bandit19@bandit.labs.overthewire.org
# IueksS7Ubh8G3DCwVzrTd8rAVOwq3M5x http://overthewire.org/wargames/bandit/bandit20.html
```
```bash
$ ls
bandit20-do
$ ./bandit20-do
Run a command as another user.
  Example: ./bandit20-do id
$ ./bandit20-do id
uid=11019(bandit19) gid=11019(bandit19) euid=11020(bandit20) groups=11019(bandit19)
```
`euid` is the effective UID, used by the binary when executing commands. So we can execute commands as if we were `bandit20`.

*See [wikipedia user id](https://en.wikipedia.org/wiki/User_identifier)*
```bash
$ ./bandit20-do cat /etc/bandit_pass/bandit20
GbKksEFF4yrVs6il55v6gwY5aVje5f0j
```
> NB: if you enclose `cat /etc/bandit_pass/bandit20` in quotes `./bandit20-do "cat /etc/bandit_pass/bandit20"`, it won't work and will display `env: ‘cat /etc/bandit_pass/bandit20’: No such file or directory`

### Level 20 - Socket communication with server and client
```bash
ssh -p 2220 bandit20@bandit.labs.overthewire.org
# GbKksEFF4yrVs6il55v6gwY5aVje5f0j http://overthewire.org/wargames/bandit/bandit21.html
```
There're multiple ways to achieve this challenge:
- Connect twice in SSH
- Use the jobs with `fg` and `bg`
- Use `tmux` to have 2 terminals in the same SSH session

I personally find the `tmux` method the most elegant one, so let's do it!

`tmux` works with a prefix, then a key which executes a command. By default, the prefix is <kbd>Ctrl-B</kbd>. The main keys are:
- <kbd>Ctrl-B</kbd> <kbd>%</kbd> splits the terminal vertically
- <kbd>Ctrl-B</kbd> <kbd>"</kbd> splits the terminal horizontally
- <kbd>Ctrl-B</kbd> <kbd>←</kbd> activate the terminal on the left
- <kbd>Ctrl-B</kbd> <kbd>→</kbd> activate the terminal on the right

Execute `tmux` and then <kbd>Ctrl-B</kbd> <kbd>%</kbd>, you'll have the following:
![](/assets/images/2018/12/overthewire-bandit20-tmux.jpg)

`$1` will refer to the left terminal and `$2` to the one on the right:
```bash
$2 nc -vvv -l -p 2048
$1 ls
suconnect
$1 ./suconnect 2048
$2 GbKksEFF4yrVs6il55v6gwY5aVje5f0j
$1
Read: GbKksEFF4yrVs6il55v6gwY5aVje5f0j
Password matches, sending next password
$2
gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr
```

![](/assets/images/2018/12/overthewire-bandit20.jpg)

This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018-11-30-linux-training %})
- Linux training with overthewire Part 2: Bandit 11-20
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-3 %})
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-4 %})

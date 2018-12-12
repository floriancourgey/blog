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

### Level 11 - ROT13 without any programming language
```bash
ssh -p 2220 bandit11@bandit.labs.overthewire.org
# IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR http://overthewire.org/wargames/bandit/bandit11.html
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
# 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu http://overthewire.org/wargames/bandit/bandit12.html
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
# 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL http://overthewire.org/wargames/bandit/bandit13.html
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
# 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e http://overthewire.org/wargames/bandit/bandit14.html
```
Send TCP/UDP data to server/port with `nc`:
```bash
$ cat /etc/bandit_pass/bandit14 | nc localhost 30000
BfMYroe26WYalil77FoDi9qh59eK5xNr
```

### Level 15 - SSL connection with `openssl`
```bash
ssh -p 2220 bandit15@bandit.labs.overthewire.org
# BfMYroe26WYalil77FoDi9qh59eK5xNr http://overthewire.org/wargames/bandit/bandit15.html
```
`openssl` comes with a lot of tools, such as Creation and Management of keys, Certificates Creation, SSL client, etc ([man openssl](https://linux.die.net/man/1/openssl)). We are going to use the SSL client `s_client` [man s_client](https://linux.die.net/man/1/s_client):
```bash
$ cat /etc/bandit_pass/bandit15 | openssl s_client -ign_eof -connect localhost:30001
cluFn7wTiGryunymYOu4RcffSxQluehd
```

### Level 16 - Scan server ports with `nmap`
```bash
ssh -p 2220 bandit16@bandit.labs.overthewire.org
# cluFn7wTiGryunymYOu4RcffSxQluehd http://overthewire.org/wargames/bandit/bandit16.html
```
`nmap` is one of the best tools for server pentesting and auditing: it guesses OS name, open ports, running services, firewalls and many other features. See [man nmap](https://linux.die.net/man/1/nmap).
```bash
$ nmap localhost -p31000-32000
PORT      STATE SERVICE
31518/tcp open  unknown
31790/tcp open  unknown
31960/tcp open  unknown
$ cat /etc/bandit_pass/bandit16 | nc localhost 31960/tcp
cluFn7wTiGryunymYOu4RcffSxQluehd
```

### Level 17 -
```bash
ssh -p 2220 bandit17@bandit.labs.overthewire.org
# cluFn7wTiGryunymYOu4RcffSxQluehd http://overthewire.org/wargames/bandit/bandit17.html
```

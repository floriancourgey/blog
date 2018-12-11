---
title: Linux training with overthewire Part 2: Bandit 11-20
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

### Level 12 - Special filename
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
$ cat data9.bin
The password is 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
```
Finally...

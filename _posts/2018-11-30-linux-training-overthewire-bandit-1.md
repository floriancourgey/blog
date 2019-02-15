---
title: "Linux training with overthewire [Part 1/10: Bandit 1-10]"
categories: [linux,server,opensource]
---
Train your Linux skills with the excellent OverTheWire wargames.
<!--more-->
## Introduction
The concept is to connect to a server through SSH and find out a password or a way to get to the next level. More info on [overthewire.org](http://overthewire.org/wargames/).

To learn how to connect via SSH, use this [SSH tutorial for Windows](https://www.digitalocean.com/docs/droplets/how-to/connect-with-ssh/putty/) and this [SSH tutorial for Linux/Mac](https://www.digitalocean.com/docs/droplets/how-to/connect-with-ssh/openssh/).

This post is part of a series:
- Linux training with overthewire Part 1: Bandit 1-10
- [Linux training with overthewire Part 2: Bandit 11-20](2018-11-30-linux-training-overthewire-bandit-2.md)
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- [Linux training with overthewire Part 4: Natas 1-10]({% post_url 2018-11-30-linux-training-overthewire-natas-1 %})
- [Linux training with overthewire Part 5: Natas 11-20]({% post_url 2018-11-30-linux-training-overthewire-natas-2 %})
- [Linux training with overthewire Part 6: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})
- [Linux training with overthewire Part 7: Krypton]({% post_url 2018-11-30-linux-training-overthewire-krypton %})

## First levels
### Level 0 - `ls` and `cat`
To connect to the first level, SSH with port `2220` as `bandit0` on `bandit.labs.overthewire.org`:
```bash
ssh -p 2220 bandit0@bandit.labs.overthewire.org
```
A quick `ls` and `cat` gives us the password for the next level:
```bash
$ ls
readme
$ cat readme
boJ9jbbUNNfktd78OOpsqOltutMc3MY1
```
<!-- todo GIF with mac terminal -->
Exit the server with `exit` and log back into the next level, using the above password.
### Level 1 - Special filename
```bash
ssh -p 2220 bandit1@bandit.labs.overthewire.org
# boJ9jbbUNNfktd78OOpsqOltutMc3MY1 http://overthewire.org/wargames/bandit/bandit2.html
```
Once again, let's try `ls` then `cat`:
```bash
$ ls
-
$ cat -
# console hanging... Exit with Ctrl-c
```
The console stops forever until Ctrl-c. This is because `-` is used as a synonym for `STDIN` (keyboard entry). Example with `vim`:
```bash
$ vim -
Vim: Reading from stdin...
```
Just prefix with `./` and you're good to go:
```bash
$ cat ./-
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
```
### Level 2 - Spaces in filename
```bash
ssh -p 2220 bandit2@bandit.labs.overthewire.org
# CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9 http://overthewire.org/wargames/bandit/bandit3.html
```
For this one, be lazy and use bash auto completion with `Tab ↹`. Start typing `spa`, then hit `Tab ↹` and let the magic happen.
```bash
$ ls
spaces in this filename
$ cat spa↹
$ cat spaces\ in\ this\ filename # or cat 'spaces in this filename'
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
```
### Level 3 - Hidden file
```bash
ssh -p 2220 bandit3@bandit.labs.overthewire.org
# UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK http://overthewire.org/wargames/bandit/bandit4.html
```
```bash
$ ls
inhere # this is a directory
$ ls inhere
# nothing
$ ls -a inhere
.  ..  .hidden
$ cat inhere/.hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB
```
### Level 4 - Many files
```bash
ssh -p 2220 bandit4@bandit.labs.overthewire.org
# pIwrPrtPN36QITSp3EQaw936yaFoFgAB http://overthewire.org/wargames/bandit/bandit5.html
```
```bash
$ ls inhere
-file00  -file01  -file02  -file03  -file04  -file05  -file06  -file07  -file08  -file09
$ cat inhere/*
▒▒▒▒▒▒▒▒▒▒~%    C[▒걱>▒▒♦| ▒▒▒▒U7▒w↓▒▒▒H▒▒ê▒Q▒�▒▒♦▒▒▒▒▒ ▒T▒v▒▒(▒ִ▒▒▒▒▒A*▒
2J▒Ş؇_▒y7▒▒.A▒▒u▒▒▒▒▒wN?c▒-▒▒Db3▒▒=▒▒▒=<▒W▒▒▒► ▒▒ht▒Z▒▒!↑►▒▒{↓▒U▒+♥▒▒p♥►m▒▒▒;◄▒▒:D▒▒^▒▒@ ▒gl▒Q▒▒♣▒@▒%@▒▒▒↑ZP*E▒▒1▒V
̫*▒▒▒↓▒ koReBOKuIDDepwhWk7jZC0RTdopnAYKh # I guess this is the one
►FPn▒▒U▒▒▒M▒▒/uXS
▒mu▒z▒▒▒хN▒{▒▒▒Y▒d4▒▒▒▒]3▒▒ ▒▒▒9(▒
```
### Level 5 - Many many files
```bash
ssh -p 2220 bandit5@bandit.labs.overthewire.org
# koReBOKuIDDepwhWk7jZC0RTdopnAYKh http://overthewire.org/wargames/bandit/bandit6.html
```
Let's use the recursive version of `ls` with `-R`: `ls -alR`:
```console
$ ls -alR
[...]
./inhere/maybehere19:
total 76
drwxr-x---  2 root bandit5 4096 Oct 16 14:00 .
drwxr-x--- 22 root bandit5 4096 Oct 16 14:00 ..
-rwxr-x---  1 root bandit5 6302 Oct 16 14:00 -file1
-rwxr-x---  1 root bandit5 7209 Oct 16 14:00 .file1
-rw-r-----  1 root bandit5 5594 Oct 16 14:00 -file2
[...]
```
We got 20 folders and each has 5-10 files. We are looking for a 1033 bytes file, let's `grep` the output:
```bash
$ ls -alR | grep 1033
-rw-r-----  1 root bandit5 1033 Oct 16 14:00 .file2
```
Sweet! But how to get the folder? `grep` can show next lines with `-A 1`, next lines with `-B 1` and previous+next lines with `-C 1`:
```bash
$ ls -alR | grep 1033 -B 10
./inhere/maybehere07:
total 56
drwxr-x---  2 root bandit5 4096 Oct 16 14:00 .
drwxr-x--- 22 root bandit5 4096 Oct 16 14:00 ..
-rwxr-x---  1 root bandit5 3663 Oct 16 14:00 -file1
-rwxr-x---  1 root bandit5 3065 Oct 16 14:00 .file1
-rw-r-----  1 root bandit5 2488 Oct 16 14:00 -file2
-rw-r-----  1 root bandit5 1033 Oct 16 14:00 .file2
```
```bash
$ cat ./inhere/maybehere07/.file2
DXjZPULLxYr17uwoI01bNLQbtFemEgo7
```

### Level 6 - A particular file on the server
```bash
ssh -p 2220 bandit6@bandit.labs.overthewire.org
# DXjZPULLxYr17uwoI01bNLQbtFemEgo7 http://overthewire.org/wargames/bandit/bandit7.html
```
This time we cannot rely on `ls`, it would be too verbose. Let's change to `find`:
```bash
$ find / -size 33c -group bandit6 -user bandit7
/var/lib/dpkg/info/bandit7.password
$ cat /var/lib/dpkg/info/bandit7.password
HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs
```

### Level 7 - A word in a file
```bash
ssh -p 2220 bandit7@bandit.labs.overthewire.org
# HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs http://overthewire.org/wargames/bandit/bandit8.html
```
```bash
$ grep millionth data.txt
millionth       cvX2JJa4CFALtqS87jk27qwqGhBM9plV
```

### Level 8 - Get unique lines
```bash
ssh -p 2220 bandit8@bandit.labs.overthewire.org
# cvX2JJa4CFALtqS87jk27qwqGhBM9plV http://overthewire.org/wargames/bandit/bandit8.html
```
Looks like a good case to use `uniq` with the `-u --unique` option. *NB: input must be sorted*
```bash
cat data.txt | sort | uniq -u
# UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
```

### Level 9 - Strings in binary file and regex
```bash
ssh -p 2220 bandit9@bandit.labs.overthewire.org
# UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR http://overthewire.org/wargames/bandit/bandit9.html
```
```bash
$ file data.txt
data.txt: data
$ strings data.txt | grep "^="
========== password
========== isa
=FQ?P\U
=       F[
=)$=
========== truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
```

### Level 10 - Strings in binary file and regex
```bash
ssh -p 2220 bandit10@bandit.labs.overthewire.org
# truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk http://overthewire.org/wargames/bandit/bandit10.html
```
```bash
$ cat data.txt
VGhlIHBhc3N3b3JkIGlzIElGdWt3S0dzRlc4TU9xM0lSRnFyeEUxaHhUTkViVVBSCg==
$ base64 -d data.txt
The password is IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
#
```

Sweet!

- Linux training with overthewire Part 1: Bandit 1-10
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018-11-30-linux-training-overthewire-bandit-3 %})
- [Linux training with overthewire Part 4: Natas]({% post_url 2018-11-30-linux-training-overthewire-natas-1 %})
- [Linux training with overthewire Part 5: Leviathan]({% post_url 2018-11-30-linux-training-overthewire-leviathan %})

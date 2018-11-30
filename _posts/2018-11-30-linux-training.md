---
title: Linux training with overthewire [Part 1/10]
author: Florian Courgey
layout: post
categories:
  - prestashop
  - google
  - opensource
  - adobe campaign
---
Train your Linux skills with the excellent OverTheWire wargames.
<!--more-->
## Introduction
The concept is to connect to a server through SSH and find out a password or a way to get to the next level. More info on [overthewire.org](http://overthewire.org/wargames/).

To learn how to connect via SSH, use this [SSH tutorial for Windows](https://www.digitalocean.com/docs/droplets/how-to/connect-with-ssh/putty/) and this [SSH tutorial for Linux/Mac](https://www.digitalocean.com/docs/droplets/how-to/connect-with-ssh/openssh/).

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
# boJ9jbbUNNfktd78OOpsqOltutMc3MY1
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
# CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
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
# UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
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
# pIwrPrtPN36QITSp3EQaw936yaFoFgAB
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
# koReBOKuIDDepwhWk7jZC0RTdopnAYKh
```
Let's use an advanced version of `ls`: `ls -alh **/*`.

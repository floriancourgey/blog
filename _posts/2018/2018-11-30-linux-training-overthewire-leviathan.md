---
title: "Linux training with overthewire [Part 6/10: Leviathan]"
date: 2018-11-30T16:00:00
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
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-3 %})
- [Linux training with overthewire Part 4: Natas 1-10]({% post_url 2018/2018-11-30-linux-training-overthewire-natas-1 %})
- [Linux training with overthewire Part 5: Natas 11-20]({% post_url 2018/2018-11-30-linux-training-overthewire-natas-2 %})
- Linux training with overthewire Part 6: Leviathan
- [Linux training with overthewire Part 7: Krypton]({% post_url 2018/2018-11-30-linux-training-overthewire-krypton %})

### Level 0 - `ls` and `cat`
```bash
ssh -p 2223 leviathan0@leviathan.labs.overthewire.org
# leviathan0 http://overthewire.org/wargames/leviathan/leviathan0.html
```
```bash
$ ls -a
.  ..  .backup  .bash_logout  .bashrc  .profile
$ ls .backup
bookmarks.html
$ grep pass .backup/bookmarks.html
This will be fixed later, the password for leviathan1 is rioGegei8m
```

### Level 1 - `radare2` bin disassembly
```bash
ssh -p 2223 leviathan1@leviathan.labs.overthewire.org
# rioGegei8m http://overthewire.org/wargames/leviathan/leviathan1.html
```
```bash
$ ls
check
$ check
password: test
Wrong password, Good Bye ...
$ radare2 check
[0x08048440]> aa
[0x08048440]> pdf @ main
|           0x0804854d      c745f0736578.  mov dword [local_10h], 0x786573 ; 'sex' # store 'sex' in variable local_10h
|           0x08048587      e844feffff     call sym.imp.getchar        ; int getchar(void)
|           0x0804858c      8845f4         mov byte [local_ch], al # store user input in variable local_ch
|           0x080485a6      8d45f0         lea eax, [local_10h] # push local_10h as arg1
|           0x080485aa      8d45f4         lea eax, [local_ch] # push local_ch as arg2
|           0x080485ae      e8fdfdffff     call sym.imp.strcmp # call strcmp(arg1, arg2)
# so the password must be 'sex', let's try
[0x08048440]> !./check
password: sex
$ id
uid=12002(leviathan2) gid=12001(leviathan1) groups=12001(leviathan1)
$ cat /etc/leviathan_pass/leviathan2
ougahZi8Ta
```

### Level 2 -
```bash
ssh -p 2223 leviathan2@leviathan.labs.overthewire.org
# ougahZi8Ta http://overthewire.org/wargames/leviathan/leviathan2.html
```

This post is part of a series:
- [Linux training with overthewire Part 1: Bandit 1-10]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-1 %})
- [Linux training with overthewire Part 2: Bandit 11-20]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-2 %})
- [Linux training with overthewire Part 3: Bandit 21-30]({% post_url 2018/2018-11-30-linux-training-overthewire-bandit-3 %})
- [Linux training with overthewire Part 4: Natas]({% post_url 2018/2018-11-30-linux-training-overthewire-natas-1 %})
- Linux training with overthewire Part 5: Leviathan

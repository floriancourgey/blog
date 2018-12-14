---
title: Crack & Hack cheatsheet
author: Florian Courgey
layout: post
categories: [opensource,linux,server,network,unix,crack,hack]
---
Cheatsheet for various unix tools such as enumeration, nmap, radare2 and volatility.
<!--more-->
## Introduction
<style>#introduction:before{content: "";counter-increment: h2 -1}</style>
1. [Network scanning with nmap](#nmap)
1. [Reverse engineering with radare2](#radare2)
1. [Memdump forensics with volatility](#volatility)
1. [Wordlist & dictionnaries](#dictionnaries)
1. [Unix server enumeration](#enumeration)

## nmap

Most common port can be found in any Unix distribution in `/etc/services`:
```bash
$ less /etc/services
tcpmux 1/tcp
echo 7/udp
discard 9/udp sink null
systat 11/tcp users
daytime 13/udp
netstat 15/tcp
```

> This is to be used by programs by calling standard C APIs

### Install
```bash
$ sudo apt-get install nmap # linux
$ # for Mac
PS> curl https://nmap.org/dist/nmap-7.70-win32.zip ; expand-archive -path .\nmap-7.70-win32.zip -destinationpath . # for Windows with PowerShell
# You should also install Npcap (https://nmap.org/npcap/#download)
```

> `nmap` will install an updated version of `/etc/services` in `/usr/share/nmap/nmap-services`.

### Usage
```bash
# {hostname} can be scanme.nmap.org, microsoft.com/24, 192.168.0.1; 10.0.0-255.1-254
$ nmap {hostname} # basic nmap shows IP, if host is up and scan 1000 most common ports
Nmap scan report for scanme.nmap.org (45.33.32.156). Host is up (0.078s latency).
Not shown: 996 closed ports
PORT      STATE SERVICE
22/tcp    open  ssh
80/tcp    open  http
9929/tcp  open  nping-echo
31337/tcp open  Elite
$ nmap {h} -O # adding OS detection
Device type: general purpose
Running: Linux 3.X|4.X
OS CPE: cpe:/o:linux:linux_kernel:3 cpe:/o:linux:linux_kernel:4
OS details: Linux 3.2 - 4.9
Network Distance: 20 hops
$ nmap {h} -p 40000-45000 # scan from ports 40000 to 45000
```

### References

- https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps



## radare2
Useful links
- Radare book [https://radare.gitbooks.io/radare2book/content/](https://radare.gitbooks.io/radare2book/content/)
- Crackme tutos [https://dustri.org/b/defeating-ioli-with-radare2.html](https://dustri.org/b/defeating-ioli-with-radare2.html)

### Basics
```bash
$ radare2 my_executable.exe # for Windows
$ r2 my_bin # for UNIX
[0x00401220]> # r2 opens a shell-like
[0x00401220]> i # file info
  file     ~\my_bin
  format   pe
  iorw     false
  mode     r-x
  size     0x3c94
  humansz  15.1K
  type     EXEC (Executable file)
  arch     x86
  binsz    15508
  bintype  pe
  bits     32
[0x00401220]> ? 0x636261 # debug string in various formats
  hex     0x636261
  octal   030661141
  int32   6513249
  string  "abc"
  binary  0b011000110110001001100001
  fvalue: 6513249.0
[0x00401220]> ls | grep 'test' # for Unix
[0x00401220]> ls ~ 'test' # built-in platform-independant grep ~ (can be used on Windows)
[0x00401220]> !uname -a && ./my_bin # execute any binary with the prefix "!"
```

### Search and display
```bash
[0x00000010]> s # print current address
0x10
[0x00000020]> s 0x20 # go to address 0x20
[0x00000020]> pd 20 # print next 20 disassembly lines
[0x00000020]> iz # print all strings
000 0x0000100b 0x0040300b  29  30 (.rdata) ascii This is the first string\n
001 0x0000102c 0x0040302c 119 120 (.rdata) ascii This is another string!!\n
```

### Analyze
`pdf` print disassemble function
```bash
[0x00001573]> pdf @ main
|           ;-- _main:
/ (fcn) main 193
|   main (int arg_8h, int arg_ch);
|           ; var int local_1ch @ ebp-0x1c
```

## volatility
Install:
```bash
$ wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_mac64_standalone.zip<br/>
$ unzip volatility_2.6_mac64_standalone.zip
$ cp volatility_2.6_mac64_standalone/volatility_2.6_mac64_standalone /usr/local/bin
$ ln -s /usr/local/bin/volatility_2.6_mac64_standalone  /usr/local/bin/volatility
$ volatility -h
```


Usage:
```bash
$ volatility -f file.raw imageinfo # Image info
$ volatility -f file.raw --profile=Win7SP1x86 pslist # Process list
$ volatility -f file.raw --profile=Win7SP1x86 pstree # Process list as a tree
$ [...] psscan # Hidden process list
$ envars # env vars
$ cmdscan # Command through console shell cmd.exe
$ filescan # File search
$ dumpfiles -D output/ -Q 0x000000003f22a930 # Dump file at memory address
$ printkey -K 'RealVNC\\vncserver' # Print Reg Key example 1
$ printkey -K 'Policy\\Secrets\\DefaultPassword' # Print Reg Key example 2
$ lsadump # LSA dump
$ screenshot -D output/ # Screenshot desktops
$ clipboard # Clipboard content
```
[Command reference on github.com/volatilityfoundation/volatility](https://github.com/volatilityfoundation/volatility/wiki/Command-Reference)

## Dictionnaries
- [https://github.com/fuzzdb-project/fuzzdb/tree/master/wordlists-user-passwd](https://github.com/fuzzdb-project/fuzzdb/tree/master/wordlists-user-passwd)
- [https://www.gutenberg.org/wiki/FR_Litt%C3%A9rature_(Genre)](https://www.gutenberg.org/wiki/FR_Litt%C3%A9rature_(Genre))

## Enumeration
